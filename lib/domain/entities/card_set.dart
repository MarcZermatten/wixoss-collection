/// Wixoss card set entity
class CardSet {
  final String code;
  final String name;
  final String setType;
  final String? releaseDate;
  final int totalCards;

  const CardSet({
    required this.code,
    required this.name,
    required this.setType,
    this.releaseDate,
    this.totalCards = 0,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      code: json['code'] as String,
      name: json['name'] as String,
      setType: json['set_type'] as String? ?? '',
      releaseDate: json['release_date'] as String?,
      totalCards: json['total_cards'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'set_type': setType,
        'release_date': releaseDate,
        'total_cards': totalCards,
      };
}
