import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/cards_provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../catalog/presentation/widgets/card_grid_item.dart';

class CollectionPage extends ConsumerWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCardsAsync = ref.watch(allCardsProvider);
    final collectionAsync = ref.watch(collectionMapProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Collection'),
      ),
      body: allCardsAsync.when(
        data: (allCards) => collectionAsync.when(
          data: (collection) {
            final ownedCount = collection.length;
            final totalCount = allCards.length;
            final percentage = totalCount > 0 ? (ownedCount / totalCount * 100) : 0.0;

            // Filter to only owned cards
            final ownedCards = allCards.where((c) => collection.containsKey(c.id)).toList();

            return Column(
              children: [
                // Progress summary
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        '$ownedCount / $totalCount cartes (${percentage.toStringAsFixed(1)}%)',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: totalCount > 0 ? ownedCount / totalCount : 0,
                          backgroundColor: Colors.grey[300],
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                // Collection grid
                Expanded(
                  child: ownedCards.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.collections_bookmark_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Ta collection est vide',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Appuie sur une carte dans le catalogue\npour l\'ajouter',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: ownedCards.length,
                          itemBuilder: (context, index) {
                            final card = ownedCards[index];
                            final qty = collection[card.id] ?? 0;
                            return CardGridItem(
                              card: card,
                              quantity: qty,
                              isOwned: true,
                            );
                          },
                        ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Erreur: $e')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}
