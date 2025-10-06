import 'package:flutter/material.dart';
import 'package:recipe/models/recipe.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.recipes,
    required this.onOpenRecipe,
  });

  final List<Recipe> recipes;
  final void Function(Recipe) onOpenRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: recipes.isEmpty
          ? const _EmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final r = recipes[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withValues(alpha: 0.4),
                  leading: const Icon(Icons.favorite, color: Colors.redAccent),
                  title: Text(r.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  subtitle: Text(r.subtitle),
                  onTap: () => onOpenRecipe(r),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemCount: recipes.length,
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite_border, size: 64, color: scheme.outline),
          const SizedBox(height: 8),
          Text(
            'No favorites yet',
            style: TextStyle(
              color: scheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}


