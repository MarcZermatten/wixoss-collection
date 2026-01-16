import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardDetailPage extends ConsumerWidget {
  final String cardId;

  const CardDetailPage({
    super.key,
    required this.cardId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardId),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Card image placeholder
            Container(
              width: 250,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 64),
              ),
            ),
            const SizedBox(height: 24),
            // Card name
            Text(
              'Card Name',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Card type and stats
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('SIGNI')),
                Chip(label: Text('Level 4')),
                Chip(label: Text('12000')),
              ],
            ),
            const SizedBox(height: 16),
            // Effect text
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Effect',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text('Card effect text will appear here...'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Collection controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Wishlist button
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star_outline),
              label: const Text('Add to Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}
