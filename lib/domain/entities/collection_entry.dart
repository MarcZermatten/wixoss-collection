/// User's collection entry
class CollectionEntry {
  final String cardId;
  final int quantity;
  final DateTime addedAt;
  final DateTime updatedAt;

  const CollectionEntry({
    required this.cardId,
    required this.quantity,
    required this.addedAt,
    required this.updatedAt,
  });

  CollectionEntry copyWith({
    String? cardId,
    int? quantity,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) {
    return CollectionEntry(
      cardId: cardId ?? this.cardId,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// User's wishlist entry
class WishlistEntry {
  final String cardId;
  final int priority;
  final String? notes;
  final DateTime addedAt;

  const WishlistEntry({
    required this.cardId,
    this.priority = 0,
    this.notes,
    required this.addedAt,
  });

  WishlistEntry copyWith({
    String? cardId,
    int? priority,
    String? notes,
    DateTime? addedAt,
  }) {
    return WishlistEntry(
      cardId: cardId ?? this.cardId,
      priority: priority ?? this.priority,
      notes: notes ?? this.notes,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
