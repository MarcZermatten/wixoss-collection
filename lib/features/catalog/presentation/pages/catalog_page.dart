import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/cards_provider.dart';
import '../widgets/card_grid_item.dart';

/// Filter state
final colorFilterProvider = StateProvider<Set<String>>((ref) => {});
final typeFilterProvider = StateProvider<Set<String>>((ref) => {});

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsAsync = ref.watch(filteredCardsProvider);
    final collectionAsync = ref.watch(collectionMapProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context, ref),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher une carte...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
          // Card count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: cardsAsync.when(
              data: (cards) => collectionAsync.when(
                data: (collection) {
                  final owned = cards.where((c) => collection.containsKey(c.id)).length;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cards.length} cartes',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '$owned dans ta collection',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
                loading: () => Text(
                  '${cards.length} cartes',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                error: (_, __) => Text(
                  '${cards.length} cartes',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              loading: () => const Text('Chargement...'),
              error: (e, _) => Text('Erreur: $e'),
            ),
          ),
          // Card grid
          Expanded(
            child: cardsAsync.when(
              data: (cards) => collectionAsync.when(
                data: (collection) => cards.isEmpty
                    ? const Center(child: Text('Aucune carte trouvée'))
                    : GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          final qty = collection[card.id] ?? 0;
                          return CardGridItem(
                            card: card,
                            quantity: qty,
                            isOwned: qty > 0,
                          );
                        },
                      ),
                loading: () => GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return CardGridItem(
                      card: cards[index],
                      quantity: 0,
                      isOwned: false,
                    );
                  },
                ),
                error: (_, __) => GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return CardGridItem(
                      card: cards[index],
                      quantity: 0,
                      isOwned: false,
                    );
                  },
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('Erreur: $error'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Filtres',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Color filters
              Text(
                'Couleur',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _FilterChip(
                    label: 'Blanc',
                    color: Colors.grey.shade300,
                    filterKey: 'white',
                    provider: colorFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Rouge',
                    color: Colors.red,
                    filterKey: 'red',
                    provider: colorFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Bleu',
                    color: Colors.blue,
                    filterKey: 'blue',
                    provider: colorFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Vert',
                    color: Colors.green,
                    filterKey: 'green',
                    provider: colorFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Noir',
                    color: Colors.grey.shade800,
                    filterKey: 'black',
                    provider: colorFilterProvider,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Type filters
              Text(
                'Type',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _FilterChip(
                    label: 'LRIG',
                    filterKey: 'lrig',
                    provider: typeFilterProvider,
                  ),
                  _FilterChip(
                    label: 'SIGNI',
                    filterKey: 'signi',
                    provider: typeFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Spell',
                    filterKey: 'spell',
                    provider: typeFilterProvider,
                  ),
                  _FilterChip(
                    label: 'Arts',
                    filterKey: 'arts',
                    provider: typeFilterProvider,
                  ),
                ],
              ),
              const Spacer(),
              // Reset button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(colorFilterProvider.notifier).state = {};
                    ref.read(typeFilterProvider.notifier).state = {};
                    ref.read(searchQueryProvider.notifier).state = '';
                    Navigator.pop(context);
                  },
                  child: const Text('Réinitialiser les filtres'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends ConsumerWidget {
  final String label;
  final Color? color;
  final String filterKey;
  final StateProvider<Set<String>> provider;

  const _FilterChip({
    required this.label,
    this.color,
    required this.filterKey,
    required this.provider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(provider);
    final isSelected = filters.contains(filterKey);

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        final current = ref.read(provider);
        if (selected) {
          ref.read(provider.notifier).state = {...current, filterKey};
        } else {
          ref.read(provider.notifier).state = current.where((e) => e != filterKey).toSet();
        }
      },
      avatar: color != null
          ? CircleAvatar(
              backgroundColor: color,
              radius: 8,
            )
          : null,
      selectedColor: color?.withOpacity(0.3),
    );
  }
}
