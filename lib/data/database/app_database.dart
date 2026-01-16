import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Cards table (pre-populated, read-only)
class Cards extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get setCode => text()();
  TextColumn get cardType => text()();
  TextColumn get color => text()();
  IntColumn get level => integer().nullable()();
  IntColumn get power => integer().nullable()();
  TextColumn get cost => text().nullable()();
  IntColumn get costTotal => integer().nullable()();
  IntColumn get cardLimit => integer().nullable()();
  TextColumn get lrigType => text().nullable()();
  TextColumn get classType => text().nullable()();
  BoolColumn get hasLifeBurst => boolean().withDefault(const Constant(false))();
  TextColumn get effectText => text().nullable()();
  TextColumn get lifeBurstText => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get rarity => text().nullable()();
  BoolColumn get formatAllstar => boolean().withDefault(const Constant(true))();
  BoolColumn get formatKey => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// Card Sets table
class CardSets extends Table {
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get setType => text()();
  TextColumn get releaseDate => text().nullable()();
  IntColumn get totalCards => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {code};
}

// User's collection
class CollectionEntries extends Table {
  TextColumn get cardId => text().references(Cards, #id)();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {cardId};
}

// User's wishlist
class WishlistEntries extends Table {
  TextColumn get cardId => text().references(Cards, #id)();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {cardId};
}

@DriftDatabase(tables: [Cards, CardSets, CollectionEntries, WishlistEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // Handle future migrations
        },
      );

  /// Seed the database with card data from assets
  Future<void> seedCardData() async {
    // Check if cards already exist
    final existingCount = await (select(cards)..limit(1)).get();
    if (existingCount.isNotEmpty) {
      return; // Already seeded
    }

    // Load cards from JSON
    final cardsJsonStr = await rootBundle.loadString('assets/data/cards.json');
    final List<dynamic> cardsData = jsonDecode(cardsJsonStr);

    // Load sets from JSON
    final setsJsonStr = await rootBundle.loadString('assets/data/sets.json');
    final List<dynamic> setsData = jsonDecode(setsJsonStr);

    // Insert sets
    await batch((b) {
      for (final setJson in setsData) {
        b.insert(
          cardSets,
          CardSetsCompanion.insert(
            code: setJson['code'] as String,
            name: setJson['name'] as String,
            setType: setJson['set_type'] as String? ?? '',
            releaseDate: Value(setJson['release_date'] as String?),
            totalCards: Value(setJson['total_cards'] as int? ?? 0),
          ),
        );
      }
    });

    // Insert cards in batches
    const batchSize = 500;
    for (var i = 0; i < cardsData.length; i += batchSize) {
      final end = (i + batchSize < cardsData.length) ? i + batchSize : cardsData.length;
      final batchData = cardsData.sublist(i, end);

      await batch((b) {
        for (final cardJson in batchData) {
          b.insert(
            cards,
            CardsCompanion.insert(
              id: cardJson['id'] as String,
              name: cardJson['name'] as String,
              setCode: cardJson['set_code'] as String,
              cardType: cardJson['card_type'] as String? ?? '',
              color: cardJson['color'] as String? ?? 'colorless',
              level: Value(cardJson['level'] as int?),
              power: Value(cardJson['power'] as int?),
              cost: Value(cardJson['cost'] as String?),
              costTotal: Value(cardJson['cost_total'] as int?),
              cardLimit: Value(cardJson['limit'] as int?),
              lrigType: Value(cardJson['lrig_type'] as String?),
              classType: Value(cardJson['class_type'] as String?),
              hasLifeBurst: Value(cardJson['has_life_burst'] as bool? ?? false),
              effectText: Value(cardJson['effect_text'] as String?),
              lifeBurstText: Value(cardJson['life_burst_text'] as String?),
              imageUrl: Value(cardJson['image_url'] as String?),
              rarity: Value(cardJson['rarity'] as String?),
              formatAllstar: Value(cardJson['format_allstar'] as bool? ?? true),
              formatKey: Value(cardJson['format_key'] as bool? ?? false),
            ),
          );
        }
      });
    }
  }

  // ===== CARDS QUERIES =====

  /// Get all cards
  Future<List<Card>> getAllCards() => select(cards).get();

  /// Get card by ID
  Future<Card?> getCardById(String id) =>
      (select(cards)..where((c) => c.id.equals(id))).getSingleOrNull();

  /// Get cards by set
  Future<List<Card>> getCardsBySet(String setCode) =>
      (select(cards)..where((c) => c.setCode.equals(setCode))).get();

  /// Search cards by name
  Future<List<Card>> searchCards(String query) => (select(cards)
        ..where((c) => c.name.like('%$query%') | c.effectText.like('%$query%')))
      .get();

  /// Get filtered cards
  Future<List<Card>> getFilteredCards({
    String? searchQuery,
    List<String>? colors,
    List<String>? cardTypes,
    List<String>? sets,
    int? levelMin,
    int? levelMax,
    int? powerMin,
    int? powerMax,
    bool? hasLifeBurst,
  }) {
    var query = select(cards);

    query = query..where((c) {
      Expression<bool> expr = const Constant(true);

      if (searchQuery != null && searchQuery.isNotEmpty) {
        expr = expr &
            (c.name.like('%$searchQuery%') |
                c.effectText.like('%$searchQuery%'));
      }
      if (colors != null && colors.isNotEmpty) {
        expr = expr & c.color.isIn(colors);
      }
      if (cardTypes != null && cardTypes.isNotEmpty) {
        expr = expr & c.cardType.isIn(cardTypes);
      }
      if (sets != null && sets.isNotEmpty) {
        expr = expr & c.setCode.isIn(sets);
      }
      if (levelMin != null) {
        expr = expr & c.level.isBiggerOrEqualValue(levelMin);
      }
      if (levelMax != null) {
        expr = expr & c.level.isSmallerOrEqualValue(levelMax);
      }
      if (powerMin != null) {
        expr = expr & c.power.isBiggerOrEqualValue(powerMin);
      }
      if (powerMax != null) {
        expr = expr & c.power.isSmallerOrEqualValue(powerMax);
      }
      if (hasLifeBurst != null) {
        expr = expr & c.hasLifeBurst.equals(hasLifeBurst);
      }

      return expr;
    });

    query = query
      ..orderBy([
        (c) => OrderingTerm(expression: c.setCode),
        (c) => OrderingTerm(expression: c.id),
      ]);

    return query.get();
  }

  // ===== COLLECTION QUERIES =====

  /// Get all collection entries
  Future<List<CollectionEntry>> getCollection() => select(collectionEntries).get();

  /// Get collection as map (cardId -> quantity)
  Future<Map<String, int>> getCollectionMap() async {
    final entries = await select(collectionEntries).get();
    return Map.fromEntries(entries.map((e) => MapEntry(e.cardId, e.quantity)));
  }

  /// Add or update collection entry
  Future<void> setCollectionQuantity(String cardId, int quantity) async {
    if (quantity <= 0) {
      await (delete(collectionEntries)..where((e) => e.cardId.equals(cardId)))
          .go();
    } else {
      await into(collectionEntries).insertOnConflictUpdate(
        CollectionEntriesCompanion.insert(
          cardId: cardId,
          quantity: Value(quantity),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// Get collection count
  Future<int> getCollectionUniqueCount() async {
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM collection_entries',
    ).getSingle();
    return result.read<int>('count');
  }

  /// Get total cards owned (sum of quantities)
  Future<int> getCollectionTotalCount() async {
    final result = await customSelect(
      'SELECT COALESCE(SUM(quantity), 0) as total FROM collection_entries',
    ).getSingle();
    return result.read<int>('total');
  }

  // ===== WISHLIST QUERIES =====

  /// Get all wishlist entries
  Future<List<WishlistEntry>> getWishlist() =>
      (select(wishlistEntries)..orderBy([(w) => OrderingTerm.desc(w.priority)]))
          .get();

  /// Add to wishlist
  Future<void> addToWishlist(String cardId, {int priority = 0, String? notes}) =>
      into(wishlistEntries).insertOnConflictUpdate(
        WishlistEntriesCompanion.insert(
          cardId: cardId,
          priority: Value(priority),
          notes: Value(notes),
        ),
      );

  /// Remove from wishlist
  Future<void> removeFromWishlist(String cardId) =>
      (delete(wishlistEntries)..where((w) => w.cardId.equals(cardId))).go();

  /// Check if card is in wishlist
  Future<bool> isInWishlist(String cardId) async {
    final entry = await (select(wishlistEntries)
          ..where((w) => w.cardId.equals(cardId)))
        .getSingleOrNull();
    return entry != null;
  }

  // ===== STATS QUERIES =====

  /// Get collection stats by color
  Future<Map<String, int>> getCollectionByColor() async {
    final result = await customSelect('''
      SELECT c.color, COUNT(ce.card_id) as count
      FROM cards c
      LEFT JOIN collection_entries ce ON c.id = ce.card_id
      WHERE ce.card_id IS NOT NULL
      GROUP BY c.color
    ''').get();

    return Map.fromEntries(
      result.map((row) => MapEntry(
            row.read<String>('color'),
            row.read<int>('count'),
          )),
    );
  }

  /// Get card count by color (total available)
  Future<Map<String, int>> getTotalByColor() async {
    final result = await customSelect('''
      SELECT color, COUNT(*) as count
      FROM cards
      GROUP BY color
    ''').get();

    return Map.fromEntries(
      result.map((row) => MapEntry(
            row.read<String>('color'),
            row.read<int>('count'),
          )),
    );
  }

  /// Get set completion stats
  Future<List<Map<String, dynamic>>> getSetCompletionStats() async {
    final result = await customSelect('''
      SELECT
        s.code,
        s.name,
        s.total_cards,
        COUNT(ce.card_id) as owned_count
      FROM card_sets s
      LEFT JOIN cards c ON c.set_code = s.code
      LEFT JOIN collection_entries ce ON ce.card_id = c.id
      GROUP BY s.code
      ORDER BY s.release_date DESC
    ''').get();

    return result
        .map((row) => {
              'code': row.read<String>('code'),
              'name': row.read<String>('name'),
              'total_cards': row.read<int>('total_cards'),
              'owned_count': row.read<int>('owned_count'),
            })
        .toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wixoss_collection.db'));
    return NativeDatabase.createInBackground(file);
  });
}
