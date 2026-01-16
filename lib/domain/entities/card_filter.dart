import 'card.dart';

/// Filter criteria for cards
class CardFilter {
  final String searchQuery;
  final List<WixossColor> colors;
  final List<CardType> cardTypes;
  final List<String> sets;
  final int? levelMin;
  final int? levelMax;
  final int? powerMin;
  final int? powerMax;
  final bool? hasLifeBurst;
  final CollectionStatus collectionStatus;

  const CardFilter({
    this.searchQuery = '',
    this.colors = const [],
    this.cardTypes = const [],
    this.sets = const [],
    this.levelMin,
    this.levelMax,
    this.powerMin,
    this.powerMax,
    this.hasLifeBurst,
    this.collectionStatus = CollectionStatus.all,
  });

  /// Check if any filter is active
  bool get hasActiveFilters =>
      searchQuery.isNotEmpty ||
      colors.isNotEmpty ||
      cardTypes.isNotEmpty ||
      sets.isNotEmpty ||
      levelMin != null ||
      levelMax != null ||
      powerMin != null ||
      powerMax != null ||
      hasLifeBurst != null ||
      collectionStatus != CollectionStatus.all;

  /// Count of active filters
  int get activeFilterCount {
    int count = 0;
    if (searchQuery.isNotEmpty) count++;
    if (colors.isNotEmpty) count++;
    if (cardTypes.isNotEmpty) count++;
    if (sets.isNotEmpty) count++;
    if (levelMin != null || levelMax != null) count++;
    if (powerMin != null || powerMax != null) count++;
    if (hasLifeBurst != null) count++;
    if (collectionStatus != CollectionStatus.all) count++;
    return count;
  }

  CardFilter copyWith({
    String? searchQuery,
    List<WixossColor>? colors,
    List<CardType>? cardTypes,
    List<String>? sets,
    int? levelMin,
    int? levelMax,
    int? powerMin,
    int? powerMax,
    bool? hasLifeBurst,
    CollectionStatus? collectionStatus,
  }) {
    return CardFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      colors: colors ?? this.colors,
      cardTypes: cardTypes ?? this.cardTypes,
      sets: sets ?? this.sets,
      levelMin: levelMin ?? this.levelMin,
      levelMax: levelMax ?? this.levelMax,
      powerMin: powerMin ?? this.powerMin,
      powerMax: powerMax ?? this.powerMax,
      hasLifeBurst: hasLifeBurst ?? this.hasLifeBurst,
      collectionStatus: collectionStatus ?? this.collectionStatus,
    );
  }

  /// Clear all filters
  CardFilter clear() => const CardFilter();
}

/// Collection status filter
enum CollectionStatus {
  all,
  owned,
  missing,
}
