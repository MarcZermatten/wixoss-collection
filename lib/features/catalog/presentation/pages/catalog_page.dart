import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Open filter drawer
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search cards...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // TODO: Update search filter
              },
            ),
          ),
          // Card grid
          Expanded(
            child: Center(
              child: Text(
                'Card catalog will appear here',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
