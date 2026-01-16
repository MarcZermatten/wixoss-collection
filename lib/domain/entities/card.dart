/// Wixoss card entity
class WixossCard {
  final String id;
  final String name;
  final String setCode;
  final CardType cardType;
  final WixossColor color;
  final int? level;
  final int? power;
  final String? cost;
  final int? costTotal;
  final int? limit;
  final String? lrigType;
  final String? classType;
  final bool hasLifeBurst;
  final String? effectText;
  final String? lifeBurstText;
  final String? imageUrl;
  final String? rarity;
  final bool formatAllstar;
  final bool formatKey;

  const WixossCard({
    required this.id,
    required this.name,
    required this.setCode,
    required this.cardType,
    required this.color,
    this.level,
    this.power,
    this.cost,
    this.costTotal,
    this.limit,
    this.lrigType,
    this.classType,
    this.hasLifeBurst = false,
    this.effectText,
    this.lifeBurstText,
    this.imageUrl,
    this.rarity,
    this.formatAllstar = true,
    this.formatKey = false,
  });

  /// Local asset path for the card image
  String get imagePath => 'assets/cards/$setCode/$id.webp';

  /// Check if this is a LRIG card
  bool get isLrig => cardType == CardType.lrig;

  /// Check if this is a SIGNI card
  bool get isSigni => cardType == CardType.signi;

  factory WixossCard.fromJson(Map<String, dynamic> json) {
    return WixossCard(
      id: json['id'] as String,
      name: json['name'] as String,
      setCode: json['set_code'] as String,
      cardType: CardType.fromString(json['card_type'] as String? ?? ''),
      color: WixossColor.fromString(json['color'] as String? ?? ''),
      level: json['level'] as int?,
      power: json['power'] as int?,
      cost: json['cost'] as String?,
      costTotal: json['cost_total'] as int?,
      limit: json['limit'] as int?,
      lrigType: json['lrig_type'] as String?,
      classType: json['class_type'] as String?,
      hasLifeBurst: json['has_life_burst'] as bool? ?? false,
      effectText: json['effect_text'] as String?,
      lifeBurstText: json['life_burst_text'] as String?,
      imageUrl: json['image_url'] as String?,
      rarity: json['rarity'] as String?,
      formatAllstar: json['format_allstar'] as bool? ?? true,
      formatKey: json['format_key'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'set_code': setCode,
        'card_type': cardType.name,
        'color': color.name,
        'level': level,
        'power': power,
        'cost': cost,
        'cost_total': costTotal,
        'limit': limit,
        'lrig_type': lrigType,
        'class_type': classType,
        'has_life_burst': hasLifeBurst,
        'effect_text': effectText,
        'life_burst_text': lifeBurstText,
        'image_url': imageUrl,
        'rarity': rarity,
        'format_allstar': formatAllstar,
        'format_key': formatKey,
      };
}

/// Card types in Wixoss
enum CardType {
  lrig,
  signi,
  spell,
  arts,
  resona,
  piece,
  key,
  assist,
  token,
  unknown;

  static CardType fromString(String value) {
    final normalized = value.toLowerCase().split('|').first.trim();
    return CardType.values.firstWhere(
      (e) => e.name == normalized,
      orElse: () => CardType.unknown,
    );
  }

  /// Target collection count per card type
  /// SIGNI: 5x, LRIG: 2x, others: 1x
  int get targetCount {
    switch (this) {
      case CardType.signi:
        return 5;
      case CardType.lrig:
        return 2;
      default:
        return 1;
    }
  }

  /// Display name in French
  String get displayName {
    switch (this) {
      case CardType.lrig:
        return 'LRIG';
      case CardType.signi:
        return 'SIGNI';
      case CardType.spell:
        return 'Spell';
      case CardType.arts:
        return 'Arts';
      case CardType.resona:
        return 'Resona';
      case CardType.piece:
        return 'Piece';
      case CardType.key:
        return 'Key';
      case CardType.assist:
        return 'Assist';
      case CardType.token:
        return 'Token';
      case CardType.unknown:
        return 'Inconnu';
    }
  }
}

/// Wixoss colors
enum WixossColor {
  white,
  red,
  blue,
  green,
  black,
  colorless;

  static WixossColor fromString(String value) {
    return WixossColor.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => WixossColor.colorless,
    );
  }

  /// Display color for UI
  int get displayColor {
    switch (this) {
      case WixossColor.white:
        return 0xFFF5F5F5;
      case WixossColor.red:
        return 0xFFE53935;
      case WixossColor.blue:
        return 0xFF1E88E5;
      case WixossColor.green:
        return 0xFF43A047;
      case WixossColor.black:
        return 0xFF424242;
      case WixossColor.colorless:
        return 0xFF9E9E9E;
    }
  }
}
