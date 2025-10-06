class Recipe {
  final String id;
  final String title;
  final String subtitle;
  final List<String> ingredients;
  final List<String> instructions;
  final String? imageUrl;

  const Recipe({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.ingredients,
    required this.instructions,
    this.imageUrl,
  });
}

// A few sample recipes to keep the app self-contained
const List<Recipe> sampleRecipes = [
  Recipe(
    id: 'r1',
    title: 'Avocado Toast',
    subtitle: 'Crunchy, creamy, ready in 5 minutes 🥑',
    ingredients: [
      '2 slices sourdough bread',
      '1 ripe avocado',
      '1 tsp lemon juice',
      'Salt & pepper to taste',
      'Chili flakes (optional)'
    ],
    instructions: [
      'Toast the bread until golden.',
      'Mash avocado with lemon juice, salt, and pepper.',
      'Spread on toast and finish with chili flakes.',
    ],
  ),
  Recipe(
    id: 'r2',
    title: 'One-Pot Pasta',
    subtitle: 'Comforting weeknight classic 🍝',
    ingredients: [
      '200g spaghetti',
      '2 cups vegetable broth',
      '1 cup cherry tomatoes',
      '2 cloves garlic, sliced',
      'Olive oil, salt, pepper'
    ],
    instructions: [
      'Add all ingredients to a pot.',
      'Bring to a boil and simmer, stirring occasionally.',
      'Cook until pasta is al dente and sauce is silky.',
    ],
  ),
  Recipe(
    id: 'r3',
    title: 'Berry Yogurt Parfait',
    subtitle: 'Light, fresh, and colorful 🍓',
    ingredients: [
      '1 cup Greek yogurt',
      '1/2 cup mixed berries',
      '1/4 cup granola',
      'Drizzle of honey'
    ],
    instructions: [
      'Layer yogurt, berries, and granola in a glass.',
      'Repeat layers and drizzle with honey.',
      'Serve immediately for the perfect crunch.',
    ],
  ),
];


