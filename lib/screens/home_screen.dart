import 'package:flutter/material.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/screens/details_screen.dart';
import 'package:recipe/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<String> _favoriteIds = <String>{};

  void _toggleFavorite(String id) {
    setState(() {
      if (_favoriteIds.contains(id)) {
        _favoriteIds.remove(id);
      } else {
        _favoriteIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book'),
        actions: [
          IconButton(
            tooltip: 'View Favorites',
            icon: const Icon(Icons.favorite),
            onPressed: () {
              final favorites = widget.recipes
                  .where((r) => _favoriteIds.contains(r.id))
                  .toList();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FavoritesScreen(
                    recipes: favorites,
                    onOpenRecipe: (recipe) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(
                            recipe: recipe,
                            isFavorite: _favoriteIds.contains(recipe.id),
                            onToggleFavorite: () => _toggleFavorite(recipe.id),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          _HeaderCard(onViewFavorites: () {
            final favorites = widget.recipes
                .where((r) => _favoriteIds.contains(r.id))
                .toList();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FavoritesScreen(
                  recipes: favorites,
                  onOpenRecipe: (recipe) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          recipe: recipe,
                          isFavorite: _favoriteIds.contains(recipe.id),
                          onToggleFavorite: () => _toggleFavorite(recipe.id),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          ...widget.recipes.map((r) => _RecipeCard(
                recipe: r,
                isFavorite: _favoriteIds.contains(r.id),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailsScreen(
                        recipe: r,
                        isFavorite: _favoriteIds.contains(r.id),
                        onToggleFavorite: () => _toggleFavorite(r.id),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.onViewFavorites});

  final VoidCallback onViewFavorites;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primaryContainer, scheme.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Cook something delightful today! 👩‍🍳',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          FilledButton.tonal(
            onPressed: onViewFavorites,
            child: const Text('View Favorites'),
          ),
        ],
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({
    required this.recipe,
    required this.isFavorite,
    required this.onTap,
  });

  final Recipe recipe;
  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            scheme.surfaceContainerHighest.withValues(alpha: 0.7),
            scheme.surfaceContainerHighest.withValues(alpha: 0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: scheme.primaryContainer,
                  child: Text(
                    recipe.title.characters.first,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              recipe.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? scheme.primary : scheme.outline,
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        recipe.subtitle,
                        style: TextStyle(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


