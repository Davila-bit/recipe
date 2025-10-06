import 'package:flutter/material.dart';
import 'package:recipe/models/recipe.dart';
import 'package:recipe/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = sampleRecipes;

    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7E57C2)),
        useMaterial3: true,
        fontFamily: 'Sans',
      ),
      home: HomeScreen(recipes: recipes),
    );
  }
}
