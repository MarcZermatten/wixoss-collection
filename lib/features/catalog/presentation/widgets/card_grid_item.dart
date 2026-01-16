import 'package:flutter/material.dart';
import '../../../../data/database/app_database.dart' as db;

class CardGridItem extends StatelessWidget {
  final db.Card card;

  const CardGridItem({super.key, required this.card});

  /// Get the local asset path for the card image
  String get _imagePath {
    // Image stored as: assets/cards/{set_code}/{card_id}.webp
    return 'assets/cards/${card.setCode}/${card.id}.webp';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to card detail
        _showCardDetail(context);
      },
      child: Container(
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
          child: Image.asset(
            _imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image not found
              return Container(
                color: _getColorForCard(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      card.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
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

  void _showCardDetail(BuildContext context) {
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
