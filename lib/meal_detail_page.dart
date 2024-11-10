import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  final String meal;
  final String description;
  final int kcal;
  final int grams;
  final int protein;
  final int carbs;
  final int fats;
  final List<String> ingredients;

  const MealDetailPage({
    super.key,
    this.meal = "Default Meal",
    this.description = "This is a default description for the meal.",
    this.kcal = 200,
    this.grams = 100,
    this.protein = 10,
    this.carbs = 20,
    this.fats = 5,
    this.ingredients = const ["Egg", "Flour", "Sugar", "Butter", "Salt"],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal Plan',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display only the 'optional.png' image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/optional.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Meal Title
            Text(
              meal,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '6 healthy ingredients',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 16),

            // Meal Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Nutritional Information
            const Text(
              'Nutritional Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _nutritionInfo("Calories", "$kcal kcal"),
                _nutritionInfo("Weight", "$grams g"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _nutritionInfo("Protein", "$protein g"),
                _nutritionInfo("Carbs", "$carbs g"),
                _nutritionInfo("Fats", "$fats g"),
              ],
            ),
            const SizedBox(height: 20),

            // Ingredients Section
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: ingredients.map((ingredient) {
                return Chip(
                  label: Text(
                    ingredient,
                    style: const TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                  backgroundColor: Colors.blue[50],
                  avatar: const Icon(Icons.check, color: Colors.blueAccent, size: 18),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for creating nutritional info widgets
  Widget _nutritionInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
