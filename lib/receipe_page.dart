import 'package:flutter/material.dart';
import 'package:wellnest/recepie_detail.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Recipes list',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRecipeItem(context, 'Recipe for obesity'),
            _buildRecipeItem(context, 'Wholesome Delight Salad'),
            _buildRecipeItem(context, 'Nourishing Quinoa Bowl'),
            _buildRecipeItem(context, 'Vibrant Veggie Stir-Fry'),
            _buildRecipeItem(context, 'Zesty Avocado Toast'),
            _buildRecipeItem(context, 'Savory Lentil Soup'),
            _buildRecipeItem(context, 'Fresh Fruit Smoothie'),
          ],
        ),
      ),
    );
  }

  // Recipe Item Widget
  Widget _buildRecipeItem(BuildContext context, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(
          Icons.restaurant_menu,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailPage(title: title),
            ),
          );
        },
      ),
    );
  }
}
