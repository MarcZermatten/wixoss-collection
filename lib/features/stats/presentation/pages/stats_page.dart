import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall completion
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Overall Completion',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '0%',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0 / 8989 unique cards',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0,
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // By color section
            Text(
              'By Color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _ColorRow(color: 'White', count: 0, total: 1628),
                    _ColorRow(color: 'Red', count: 0, total: 1526),
                    _ColorRow(color: 'Blue', count: 0, total: 3523),
                    _ColorRow(color: 'Green', count: 0, total: 1508),
                    _ColorRow(color: 'Black', count: 0, total: 0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Set completion
            Text(
              'Set Completion',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Set completion stats will appear here',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorRow extends StatelessWidget {
  final String color;
  final int count;
  final int total;

  const _ColorRow({
    required this.color,
    required this.count,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? count / total : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(color),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: Colors.grey[300],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(
              '$count / $total',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
