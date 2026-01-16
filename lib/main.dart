import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';
import 'core/providers/database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create provider container to access providers
  final container = ProviderContainer();

  // Initialize database and seed data
  await container.read(databaseInitProvider.future);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const WixossCollectionApp(),
    ),
  );
}
