#!/usr/bin/env python3
"""
Convert Wixoss Cockatrice XML to Flutter-ready JSON
Source: https://github.com/TetrusAO/Wixoss-TCG-Cockatrice-Plugin

Usage: python convert_wixoss_xml.py input.xml output_dir/
"""

import xml.etree.ElementTree as ET
import json
import re
import os
import sys
from dataclasses import dataclass, asdict, field
from typing import Optional, List
from pathlib import Path


@dataclass
class WixossSet:
    code: str
    name: str
    set_type: str
    release_date: Optional[str] = None
    total_cards: int = 0


@dataclass
class WixossCard:
    id: str                          # "WD01-001"
    name: str
    set_code: str
    card_type: str                   # "lrig", "signi", "spell", "arts"
    color: str                       # "white", "red", "blue", "green", "black", "colorless"
    level: Optional[int] = None
    power: Optional[int] = None
    cost: Optional[str] = None       # "4 - WWW" format original
    cost_total: Optional[int] = None # CMC
    limit: Optional[int] = None      # Pour LRIG
    lrig_type: Optional[str] = None  # "Tama", "Iona", etc.
    class_type: Optional[str] = None # "War Spirit: Armed", etc.
    has_life_burst: bool = False
    effect_text: Optional[str] = None
    life_burst_text: Optional[str] = None
    image_url: Optional[str] = None
    rarity: Optional[str] = None
    format_allstar: bool = True
    format_key: bool = False


def parse_color(color_code: str) -> str:
    """Convert color codes to full names"""
    color_map = {
        'W': 'white',
        'R': 'red',
        'U': 'blue',
        'B': 'blue',     # Sometimes B is used for blue
        'G': 'green',
        'Bk': 'black',
        'Black': 'black',
        'C': 'colorless',
        '': 'colorless'
    }
    # Handle multi-color or unknown
    color = color_code.strip().upper() if color_code else ''
    return color_map.get(color, color_map.get(color_code, 'colorless'))


def parse_card_type(type_str: str, maintype: str) -> tuple:
    """
    Parse card type string
    Returns: (card_type, lrig_type, class_type, has_life_burst)

    Examples:
    - "LRIG - Tama" -> ("lrig", "Tama", None, False)
    - "SIGNI|LB - War Spirit: Armed - Tama Limited" -> ("signi", None, "War Spirit: Armed", True)
    - "Spell" -> ("spell", None, None, False)
    """
    type_str = type_str or ''
    maintype = maintype or ''
    has_lb = '|LB' in maintype or '|LB' in type_str

    # Extract main type
    main = maintype.replace('|LB', '').strip().lower()
    card_type_map = {
        'lrig': 'lrig',
        'signi': 'signi',
        'spell': 'spell',
        'arts': 'arts',
        'resona': 'resona',
        'piece': 'piece',
        'key': 'key',
        'coin': 'coin',
        'assist': 'assist',
    }
    card_type = card_type_map.get(main, main)

    # Parse the full type string for details
    lrig_type = None
    class_type = None

    if ' - ' in type_str:
        parts = type_str.split(' - ')
        if len(parts) >= 2:
            if card_type == 'lrig':
                # "LRIG - Tama" or "LRIG - Tama (KS)"
                lrig_type = parts[1].split('(')[0].strip()
            elif card_type == 'signi':
                # "SIGNI|LB - War Spirit: Armed - Tama Limited"
                class_type = parts[1].strip()
                # Remove limitation suffix if present
                for suffix in [' Limited', ' (KS)', ' (DS)']:
                    class_type = class_type.replace(suffix, '')

    return card_type, lrig_type, class_type, has_lb


def extract_life_burst(text: str) -> Optional[str]:
    """Extract Life Burst text from effect text"""
    if not text:
        return None

    # Pattern: [Life Burst]: ... jusqu'à la fin ou prochain [
    match = re.search(r'\[Life Burst\]:\s*(.+?)(?=\[|$)', text, re.DOTALL | re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return None


def extract_effect_text(text: str) -> Optional[str]:
    """Extract main effect text (before Life Burst)"""
    if not text:
        return None

    # Remove Life Burst section
    effect = re.sub(r'\[Life Burst\]:\s*.+?(?=\[|$)', '', text, flags=re.DOTALL | re.IGNORECASE)
    effect = effect.strip()
    return effect if effect else None


def extract_card_id(set_code: str, pic_url: str, name: str, card_index: int) -> str:
    """
    Extract card ID from set code and picture URL
    Falls back to set_code + index if URL doesn't have ID
    """
    # Try to extract from URL - pattern like WD01-001.jpg or WXDi-P01-001.jpg
    if pic_url:
        # Match patterns like "WD01-001", "WXDi-P01-001", "PR-001"
        match = re.search(r'/([A-Za-z0-9-]+-\d{2,4})\.(?:jpg|png|webp)', pic_url, re.IGNORECASE)
        if match:
            return match.group(1)

    # Fallback: generate unique ID from set_code and index
    return f"{set_code}-{card_index:03d}"


def parse_xml(xml_path: str) -> tuple:
    """
    Parse Cockatrice XML file
    Returns: (list of WixossSet, list of WixossCard)
    """
    tree = ET.parse(xml_path)
    root = tree.getroot()

    sets = {}
    cards = []

    # Parse sets
    for set_elem in root.findall('.//set'):
        code = set_elem.find('name').text if set_elem.find('name') is not None else ''
        longname = set_elem.find('longname').text if set_elem.find('longname') is not None else code
        settype = set_elem.find('settype').text if set_elem.find('settype') is not None else ''
        releasedate = set_elem.find('releasedate').text if set_elem.find('releasedate') is not None else None

        sets[code] = WixossSet(
            code=code,
            name=longname,
            set_type=settype,
            release_date=releasedate
        )

    # Parse cards - track index per set for fallback IDs
    set_card_indices = {}

    for card_elem in root.findall('.//card'):
        name_elem = card_elem.find('name')
        if name_elem is None:
            continue
        name = name_elem.text or ''

        # Set info with picURL
        set_elem = card_elem.find('set')
        set_code = set_elem.text if set_elem is not None else 'UNKNOWN'
        pic_url = set_elem.get('picURL') if set_elem is not None else None

        # Track card index within set
        if set_code not in set_card_indices:
            set_card_indices[set_code] = 0
        set_card_indices[set_code] += 1
        card_index = set_card_indices[set_code]

        # Card ID
        card_id = extract_card_id(set_code, pic_url, name, card_index)

        # Text/effects
        text_elem = card_elem.find('text')
        full_text = text_elem.text if text_elem is not None and text_elem.text else ''

        # Properties
        prop = card_elem.find('prop')
        if prop is None:
            continue

        colors = prop.find('colors')
        color = parse_color(colors.text if colors is not None else '')

        manacost = prop.find('manacost')
        cost = manacost.text if manacost is not None else None

        cmc = prop.find('cmc')
        cost_total = int(cmc.text) if cmc is not None and cmc.text else None

        type_elem = prop.find('type')
        type_str = type_elem.text if type_elem is not None else ''

        maintype = prop.find('maintype')
        maintype_str = maintype.text if maintype is not None else ''

        pt = prop.find('pt')
        power = int(pt.text) if pt is not None and pt.text and pt.text.isdigit() else None

        loyalty = prop.find('loyalty')
        limit_text = loyalty.text if loyalty is not None else None
        if limit_text and limit_text.isdigit():
            limit = int(limit_text)
        elif limit_text == '∞':
            limit = 999  # Infinity represented as 999
        else:
            limit = None

        # Format legality
        format_allstar = prop.find('format-allstar')
        format_key = prop.find('format-key')
        is_allstar = format_allstar is not None and format_allstar.text == 'legal'
        is_key = format_key is not None and format_key.text == 'legal'

        # Parse type details
        card_type, lrig_type, class_type, has_lb = parse_card_type(type_str, maintype_str)

        # Level (from cost_total for LRIG, from manacost for SIGNI)
        level = cost_total if card_type in ['lrig', 'signi'] else None

        card = WixossCard(
            id=card_id,
            name=name,
            set_code=set_code,
            card_type=card_type,
            color=color,
            level=level,
            power=power,
            cost=cost,
            cost_total=cost_total,
            limit=limit,
            lrig_type=lrig_type,
            class_type=class_type,
            has_life_burst=has_lb,
            effect_text=extract_effect_text(full_text),
            life_burst_text=extract_life_burst(full_text) if has_lb else None,
            image_url=pic_url,
            format_allstar=is_allstar,
            format_key=is_key
        )
        cards.append(card)

        # Count cards per set
        if set_code in sets:
            sets[set_code].total_cards += 1

    return list(sets.values()), cards


def main():
    if len(sys.argv) < 2:
        # Default paths
        xml_path = r"C:\Users\zema\GeoBrain\temp\wixoss_cards.xml"
        output_dir = r"C:\Users\zema\GeoBrain\projets\wixoss-collection\assets\data"
    else:
        xml_path = sys.argv[1]
        output_dir = sys.argv[2] if len(sys.argv) > 2 else "."

    print(f"Parsing {xml_path}...")
    sets, cards = parse_xml(xml_path)

    print(f"Found {len(sets)} sets and {len(cards)} cards")

    # Create output directory
    Path(output_dir).mkdir(parents=True, exist_ok=True)

    # Export cards.json
    cards_path = Path(output_dir) / "cards.json"
    with open(cards_path, 'w', encoding='utf-8') as f:
        json.dump([asdict(c) for c in cards], f, indent=2, ensure_ascii=False)
    print(f"Exported cards to {cards_path}")

    # Export sets.json
    sets_path = Path(output_dir) / "sets.json"
    with open(sets_path, 'w', encoding='utf-8') as f:
        json.dump([asdict(s) for s in sets], f, indent=2, ensure_ascii=False)
    print(f"Exported sets to {sets_path}")

    # Stats
    print("\n=== Statistics ===")
    print(f"Total cards: {len(cards)}")

    # By type
    types = {}
    for c in cards:
        types[c.card_type] = types.get(c.card_type, 0) + 1
    print("\nBy type:")
    for t, count in sorted(types.items(), key=lambda x: -x[1]):
        print(f"  {t}: {count}")

    # By color
    colors = {}
    for c in cards:
        colors[c.color] = colors.get(c.color, 0) + 1
    print("\nBy color:")
    for col, count in sorted(colors.items(), key=lambda x: -x[1]):
        print(f"  {col}: {count}")

    # Life Burst
    lb_count = sum(1 for c in cards if c.has_life_burst)
    print(f"\nWith Life Burst: {lb_count}")

    # Sample card
    print("\n=== Sample card ===")
    sample = cards[10] if len(cards) > 10 else cards[0]
    for k, v in asdict(sample).items():
        if v:
            print(f"  {k}: {v}")


if __name__ == "__main__":
    main()
