import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart' as db;
import 'database_provider.dart';

/// Provider for all cards
final allCardsProvider = FutureProvider<List<db.Card>>((ref) async {
  final database = ref.watch(databaseProvider);
  return database.getAllCards();
});

/// Provider for cards by set
final cardsBySetProvider = FutureProvider.family<List<db.Card>, String>((ref, setCode) async {
  final database = ref.watch(databaseProvider);
  return database.getCardsBySet(setCode);
});

/// Provider for all sets
final allSetsProvider = FutureProvider<List<db.CardSet>>((ref) async {
  final database = ref.watch(databaseProvider);
  return (await database.select(database.cardSets).get());
});

/// Provider for collection map (cardId -> quantity)
final collectionMapProvider = FutureProvider<Map<String, int>>((ref) async {
  final database = ref.watch(databaseProvider);
  return database.getCollectionMap();
});

/// Search query state
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Filtered cards based on search
final filteredCardsProvider = FutureProvider<List<db.Card>>((ref) async {
  final database = ref.watch(databaseProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  if (searchQuery.isEmpty) {
    return database.getAllCards();
  }
  return database.searchCards(searchQuery);
});
