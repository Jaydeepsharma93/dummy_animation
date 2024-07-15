import 'package:dummy_animation/src/recipes/presentation/widget/home_screen/loaded_recipes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dummy_animation/src/recipes/data/recipe_repository.dart';

class AnimatedRecipesWidget extends ConsumerWidget {
  const AnimatedRecipesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final recipes = ref.watch(recipesProvider);
    return recipes.when(
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: Center(
          child: Text(error.toString()),
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (recipes) => LoadedRecipesWidget(
        recipes: recipes,
      ),
    );
  }
}