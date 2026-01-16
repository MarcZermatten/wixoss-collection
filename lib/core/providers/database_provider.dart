import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';

/// Global database instance
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Provider for database initialization status
final databaseInitProvider = FutureProvider<bool>((ref) async {
  final db = ref.watch(databaseProvider);
  await db.seedCardData();
  return true;
});
