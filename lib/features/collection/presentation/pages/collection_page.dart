import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollectionPage extends ConsumerWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Collection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              // TODO: Sort options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress summary
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: 0 / 8989 (0%)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
          ),
          // Tab bar
          const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'By Set'),
              Tab(text: 'By Color'),
            ],
          ),
          // List
          Expanded(
            child: Center(
              child: Text(
                'Your collection will appear here',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
