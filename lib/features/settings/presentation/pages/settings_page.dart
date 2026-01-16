import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Backup & Restore section
          const _SectionHeader(title: 'Backup & Restore'),
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Export Collection'),
            subtitle: const Text('Save your collection as JSON'),
            onTap: () {
              // TODO: Export
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Export not implemented yet')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Import Collection'),
            subtitle: const Text('Restore from backup'),
            onTap: () {
              // TODO: Import
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Import not implemented yet')),
              );
            },
          ),
          const Divider(),
          // Display section
          const _SectionHeader(title: 'Display'),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Theme'),
            subtitle: const Text('System default'),
            onTap: () {
              // TODO: Theme selector
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Grid Columns'),
            subtitle: const Text('3'),
            onTap: () {
              // TODO: Grid columns selector
            },
          ),
          const Divider(),
          // About section
          const _SectionHeader(title: 'About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
          ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Card Database'),
            subtitle: const Text('8989 cards'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
