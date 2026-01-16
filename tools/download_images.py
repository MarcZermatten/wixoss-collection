#!/usr/bin/env python3
"""
Download Wixoss card images from official source
Can filter by set codes to limit download scope

Usage:
    python download_images.py                    # Download all
    python download_images.py --sets WD01,WD02   # Download specific sets
    python download_images.py --list-sets        # List available sets
"""

import json
import os
import sys
import time
import argparse
import urllib.request
import urllib.error
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed


def load_cards(json_path: str) -> list:
    """Load cards from JSON file"""
    with open(json_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def load_sets(json_path: str) -> list:
    """Load sets from JSON file"""
    with open(json_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def download_image(card: dict, output_dir: Path, retry: int = 3) -> tuple:
    """
    Download a single card image
    Returns: (card_id, success, message)
    """
    if not card.get('image_url'):
        return (card['id'], False, 'No image URL')

    set_dir = output_dir / card['set_code']
    set_dir.mkdir(parents=True, exist_ok=True)

    # Output filename
    output_path = set_dir / f"{card['id']}.jpg"

    # Skip if already exists AND has content
    if output_path.exists() and output_path.stat().st_size > 1000:
        return (card['id'], True, 'Already exists')

    url = card['image_url']

    for attempt in range(retry):
        try:
            # Add headers to mimic browser
            req = urllib.request.Request(url, headers={
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            })

            with urllib.request.urlopen(req, timeout=30) as response:
                data = response.read()

            with open(output_path, 'wb') as f:
                f.write(data)

            return (card['id'], True, 'Downloaded')

        except urllib.error.HTTPError as e:
            if e.code == 404:
                return (card['id'], False, f'Not found (404)')
            time.sleep(1)
        except Exception as e:
            time.sleep(1)

    return (card['id'], False, f'Failed after {retry} attempts')


def main():
    parser = argparse.ArgumentParser(description='Download Wixoss card images')
    parser.add_argument('--sets', type=str, help='Comma-separated list of set codes to download')
    parser.add_argument('--list-sets', action='store_true', help='List available sets and exit')
    parser.add_argument('--workers', type=int, default=4, help='Number of parallel downloads')
    parser.add_argument('--cards-json', type=str,
                        default=r'C:\Users\zema\GeoBrain\projets\wixoss-collection\assets\data\cards.json')
    parser.add_argument('--sets-json', type=str,
                        default=r'C:\Users\zema\GeoBrain\projets\wixoss-collection\assets\data\sets.json')
    parser.add_argument('--output', type=str,
                        default=r'C:\Users\zema\GeoBrain\projets\wixoss-collection\raw_images')

    args = parser.parse_args()

    # Load data
    cards = load_cards(args.cards_json)
    sets = load_sets(args.sets_json)

    # List sets mode
    if args.list_sets:
        # Force UTF-8 output
        import io
        sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

        print(f"{'Code':<12} {'Name':<50} {'Cards':>6}")
        print("-" * 70)
        for s in sorted(sets, key=lambda x: x['code']):
            name = s['name'][:48] if s['name'] else ''
            print(f"{s['code']:<12} {name:<50} {s['total_cards']:>6}")
        print(f"\nTotal: {len(sets)} sets, {len(cards)} cards")
        return

    # Filter by sets if specified
    if args.sets:
        set_filter = [s.strip().upper() for s in args.sets.split(',')]
        cards = [c for c in cards if c['set_code'].upper() in set_filter]
        print(f"Filtering to sets: {set_filter}")

    if not cards:
        print("No cards to download!")
        return

    print(f"Downloading {len(cards)} card images...")
    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Download with thread pool
    success_count = 0
    skip_count = 0
    fail_count = 0

    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {
            executor.submit(download_image, card, output_dir): card
            for card in cards
        }

        for i, future in enumerate(as_completed(futures)):
            card_id, success, message = future.result()

            if success:
                if message == 'Already exists':
                    skip_count += 1
                else:
                    success_count += 1
            else:
                fail_count += 1
                print(f"  FAILED: {card_id} - {message}")

            # Progress update every 100 cards
            if (i + 1) % 100 == 0:
                print(f"Progress: {i + 1}/{len(cards)} ({success_count} new, {skip_count} skipped, {fail_count} failed)")

    print(f"\n=== Download Complete ===")
    print(f"New downloads: {success_count}")
    print(f"Already existed: {skip_count}")
    print(f"Failed: {fail_count}")
    print(f"Output directory: {output_dir}")


if __name__ == '__main__':
    main()
