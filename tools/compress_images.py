#!/usr/bin/env python3
"""
Compress card images to WebP format for Flutter app
Optimizes file size while maintaining visual quality

Usage:
    python compress_images.py                    # Compress all
    python compress_images.py --sets WD01,WD02   # Compress specific sets
"""

import os
import sys
import argparse
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed

try:
    from PIL import Image
except ImportError:
    print("Error: Pillow is required. Install with: pip install Pillow")
    sys.exit(1)


# Compression settings
TARGET_WIDTH = 400          # Good for mobile display
WEBP_QUALITY = 80           # Balance quality/size
THUMBNAIL_WIDTH = 100       # For grid thumbnails (optional)


def compress_image(src_path: Path, dest_path: Path, width: int = TARGET_WIDTH, quality: int = WEBP_QUALITY) -> tuple:
    """
    Compress a single image to WebP format
    Returns: (src_path, success, message, size_before, size_after)
    """
    try:
        # Skip if destination exists and is newer
        if dest_path.exists() and dest_path.stat().st_mtime > src_path.stat().st_mtime:
            return (str(src_path), True, 'Skipped (up to date)', 0, 0)

        size_before = src_path.stat().st_size

        # Open and resize
        img = Image.open(src_path)

        # Convert to RGB if necessary (WebP doesn't support all modes)
        if img.mode in ('RGBA', 'P'):
            # Keep transparency for PNG with alpha
            if img.mode == 'RGBA':
                pass  # WebP supports RGBA
            else:
                img = img.convert('RGBA')
        elif img.mode != 'RGB':
            img = img.convert('RGB')

        # Resize maintaining aspect ratio
        aspect = img.height / img.width
        new_width = min(width, img.width)  # Don't upscale
        new_height = int(new_width * aspect)
        img = img.resize((new_width, new_height), Image.Resampling.LANCZOS)

        # Create destination directory
        dest_path.parent.mkdir(parents=True, exist_ok=True)

        # Save as WebP
        img.save(dest_path, 'WEBP', quality=quality)

        size_after = dest_path.stat().st_size
        reduction = (1 - size_after / size_before) * 100 if size_before > 0 else 0

        return (str(src_path), True, f'Compressed ({reduction:.1f}% reduction)', size_before, size_after)

    except Exception as e:
        return (str(src_path), False, str(e), 0, 0)


def main():
    parser = argparse.ArgumentParser(description='Compress Wixoss card images to WebP')
    parser.add_argument('--input', type=str,
                        default=r'C:\Users\zema\GeoBrain\projets\wixoss-collection\raw_images')
    parser.add_argument('--output', type=str,
                        default=r'C:\Users\zema\GeoBrain\projets\wixoss-collection\assets\cards')
    parser.add_argument('--sets', type=str, help='Comma-separated list of set codes')
    parser.add_argument('--width', type=int, default=TARGET_WIDTH)
    parser.add_argument('--quality', type=int, default=WEBP_QUALITY)
    parser.add_argument('--workers', type=int, default=4)

    args = parser.parse_args()

    input_dir = Path(args.input)
    output_dir = Path(args.output)

    if not input_dir.exists():
        print(f"Error: Input directory not found: {input_dir}")
        print("Run download_images.py first to download card images.")
        sys.exit(1)

    # Find all images
    image_extensions = {'.jpg', '.jpeg', '.png', '.gif', '.bmp'}
    images = []

    for ext in image_extensions:
        images.extend(input_dir.rglob(f'*{ext}'))
        images.extend(input_dir.rglob(f'*{ext.upper()}'))

    # Filter by sets if specified
    if args.sets:
        set_filter = [s.strip().upper() for s in args.sets.split(',')]
        images = [img for img in images if img.parent.name.upper() in set_filter]

    if not images:
        print("No images found to compress!")
        return

    print(f"Compressing {len(images)} images...")
    print(f"  Width: {args.width}px")
    print(f"  Quality: {args.quality}")
    print(f"  Output: {output_dir}")
    print()

    total_before = 0
    total_after = 0
    success_count = 0
    skip_count = 0
    fail_count = 0

    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        futures = {}
        for img_path in images:
            # Maintain directory structure
            rel_path = img_path.relative_to(input_dir)
            dest_path = output_dir / rel_path.parent / (rel_path.stem + '.webp')

            futures[executor.submit(compress_image, img_path, dest_path, args.width, args.quality)] = img_path

        for i, future in enumerate(as_completed(futures)):
            src, success, message, size_before, size_after = future.result()

            if success:
                if 'Skipped' in message:
                    skip_count += 1
                else:
                    success_count += 1
                    total_before += size_before
                    total_after += size_after
            else:
                fail_count += 1
                print(f"  FAILED: {src} - {message}")

            # Progress update
            if (i + 1) % 100 == 0:
                print(f"Progress: {i + 1}/{len(images)}")

    print(f"\n=== Compression Complete ===")
    print(f"Compressed: {success_count}")
    print(f"Skipped: {skip_count}")
    print(f"Failed: {fail_count}")

    if total_before > 0:
        reduction = (1 - total_after / total_before) * 100
        print(f"\nSize reduction:")
        print(f"  Before: {total_before / 1024 / 1024:.1f} MB")
        print(f"  After: {total_after / 1024 / 1024:.1f} MB")
        print(f"  Saved: {(total_before - total_after) / 1024 / 1024:.1f} MB ({reduction:.1f}%)")

    print(f"\nOutput directory: {output_dir}")


if __name__ == '__main__':
    main()
