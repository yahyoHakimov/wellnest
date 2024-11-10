import 'package:flutter/material.dart';
import 'package:wellnest/meal_detail_page.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  _MealPlanPageState createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  int selectedDayIndex = 0;

  final List<String> days = ['Day 01', 'Day 02', 'Day 03'];

  // Define a map with meals for each day
  final Map<int, List<Map<String, dynamic>>> mealPlans = {
    0: [
      {
        'title': 'Salad with egg',
        'description': 'A fresh salad with eggs for breakfast.',
        'kcal': 200,
        'grams': 150,
        'protein': 10,
        'carbs': 20,
        'fats': 5,
      },
      {
        'title': 'Grilled Chicken',
        'description': 'Healthy grilled chicken with veggies.',
        'kcal': 300,
        'grams': 250,
        'protein': 30,
        'carbs': 10,
        'fats': 10,
      },
    ],
    1: [
      {
        'title': 'Oatmeal with Berries',
        'description': 'Healthy oatmeal with fresh berries for breakfast.',
        'kcal': 180,
        'grams': 120,
        'protein': 5,
        'carbs': 35,
        'fats': 3,
      },
      {
        'title': 'Steak with Veggies',
        'description': 'Grilled steak served with assorted veggies.',
        'kcal': 350,
        'grams': 280,
        'protein': 40,
        'carbs': 15,
        'fats': 15,
      },
    ],
    2: [
      {
        'title': 'Smoothie Bowl',
        'description': 'Fruit smoothie bowl with granola.',
        'kcal': 220,
        'grams': 180,
        'protein': 7,
        'carbs': 45,
        'fats': 4,
      },
      {
        'title': 'Salmon Salad',
        'description': 'Fresh salad with grilled salmon.',
        'kcal': 300,
        'grams': 200,
        'protein': 25,
        'carbs': 15,
        'fats': 18,
      },
    ],
  };

  List<Map<String, dynamic>> meals = [];

  @override
  void initState() {
    super.initState();
    meals = mealPlans[selectedDayIndex] ?? []; // Load meals for Day 1 by default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Meal Plan', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We have prepared a 3-day meal plan for you. Follow the plan to reach your goal.',
              style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
            ),
            const SizedBox(height: 20),

            // Day Toggle Buttons
            ToggleButtons(
              isSelected: List.generate(days.length, (index) => index == selectedDayIndex),
              onPressed: (index) {
                setState(() {
                  selectedDayIndex = index;
                  meals = mealPlans[selectedDayIndex] ?? []; // Update meals based on selected day
                });
              },
              borderRadius: BorderRadius.circular(8),
              selectedColor: Colors.white,
              fillColor: Colors.blueAccent,
              color: Colors.blueAccent,
              children: days.map((day) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(day, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Meal Cards List
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return _buildMealCard(context, meal);
                },
              ),
            ),

            // Bottom Navigation Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle regenerate plan logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Regenerate Plan',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Meal Card Widget
  Widget _buildMealCard(BuildContext context, Map<String, dynamic> meal) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  meal['title'],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailPage(
                          meal: meal['title'],
                          description: meal['description'],
                          kcal: meal['kcal'],
                          grams: meal['grams'],
                          protein: meal['protein'],
                          carbs: meal['carbs'],
                          fats: meal['fats'],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${meal['kcal']} kcal • ${meal['grams']} g',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _nutritionInfo("Protein", "${meal['protein']}g"),
                _nutritionInfo("Carbs", "${meal['carbs']}g"),
                _nutritionInfo("Fats", "${meal['fats']}g"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _nutritionInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.blueAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
