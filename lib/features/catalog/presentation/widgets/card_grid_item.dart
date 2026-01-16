import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/cards_provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../data/database/app_database.dart' as db;

class CardGridItem extends ConsumerWidget {
  final db.Card card;
  final int quantity;
  final bool isOwned;

  const CardGridItem({
    super.key,
    required this.card,
    this.quantity = 0,
    this.isOwned = false,
  });

  String get _imagePath {
    return 'assets/cards/${card.setCode}/${card.id}.webp';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _showCardDetail(context, ref),
      onLongPress: () => _toggleCollection(context, ref),
      child: Stack(
        children: [
          // Card image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColorFiltered(
                colorFilter: isOwned
                    ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                    : ColorFilter.mode(Colors.grey.shade600, BlendMode.saturation),
                child: Opacity(
                  opacity: isOwned ? 1.0 : 0.5,
                  child: Image.asset(
                    _imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: _getColorForCard(),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              card.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isOwned ? Colors.white : Colors.white70,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Quantity badge
          if (quantity > 0)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'x$quantity',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          // Not owned indicator
          if (!isOwned)
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getColorForCard() {
    switch (card.color.toLowerCase()) {
      case 'white':
        return Colors.grey.shade300;
      case 'red':
        return Colors.red.shade400;
      case 'blue':
        return Colors.blue.shade400;
      case 'green':
        return Colors.green.shade400;
      case 'black':
        return Colors.grey.shade800;
      default:
        return Colors.grey.shade500;
    }
  }

  Future<void> _toggleCollection(BuildContext context, WidgetRef ref) async {
    final database = ref.read(databaseProvider);

    if (isOwned) {
      // Remove from collection
      await database.setCollectionQuantity(card.id, 0);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${card.name} retiré de la collection'),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } else {
      // Add to collection
      await database.setCollectionQuantity(card.id, 1);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${card.name} ajouté à la collection'),
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.green,
          ),
        );
      }
    }

    // Refresh collection
    ref.invalidate(collectionMapProvider);
  }

  void _showCardDetail(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
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
                  // Card image
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          _imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 400,
                              color: _getColorForCard(),
                              child: Center(
                                child: Text(
                                  card.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Collection controls
                  _CollectionControls(card: card, ref: ref),
                  const SizedBox(height: 16),
                  // Card name
                  Text(
                    card.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  // Card info
                  _buildInfoRow('Set', card.setCode),
                  _buildInfoRow('Type', card.cardType),
                  _buildInfoRow('Couleur', card.color),
                  if (card.level != null) _buildInfoRow('Niveau', '${card.level}'),
                  if (card.power != null) _buildInfoRow('Puissance', '${card.power}'),
                  if (card.lrigType != null) _buildInfoRow('LRIG', card.lrigType!),
                  if (card.classType != null) _buildInfoRow('Classe', card.classType!),
                  const SizedBox(height: 16),
                  // Effect text
                  if (card.effectText != null) ...[
                    Text(
                      'Effet',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(card.effectText!),
                  ],
                  // Life Burst
                  if (card.lifeBurstText != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Life Burst',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(card.lifeBurstText!),
                  ],
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _CollectionControls extends ConsumerWidget {
  final db.Card card;
  final WidgetRef parentRef;

  const _CollectionControls({required this.card, required WidgetRef ref}) : parentRef = ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionAsync = ref.watch(collectionMapProvider);

    return collectionAsync.when(
      data: (collection) {
        final qty = collection[card.id] ?? 0;
        final isOwned = qty > 0;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isOwned ? Colors.green.shade50 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isOwned ? Colors.green.shade200 : Colors.grey.shade300,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isOwned) ...[
                IconButton(
                  onPressed: () => _updateQuantity(ref, qty - 1),
                  icon: const Icon(Icons.remove_circle_outline),
                  color: qty > 1 ? Colors.orange : Colors.red,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$qty',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _updateQuantity(ref, qty + 1),
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.green,
                ),
              ] else ...[
                ElevatedButton.icon(
                  onPressed: () => _updateQuantity(ref, 1),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter à ma collection'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Erreur: $e'),
    );
  }

  Future<void> _updateQuantity(WidgetRef ref, int newQty) async {
    final database = ref.read(databaseProvider);
    await database.setCollectionQuantity(card.id, newQty);
    ref.invalidate(collectionMapProvider);
  }
}
