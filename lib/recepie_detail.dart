import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String title;

  const RecipeDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Recipe info',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView( // Added SingleChildScrollView here
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://via.placeholder.com/150', // Replace with the actual image URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Indulge in a delicious fresh fruit smoothie that bursts with flavor! "
                  "This delightful blend features ripe bananas, succulent strawberries, "
                  "and refreshing mangoes, all swirled together with creamy yogurt and "
                  "a splash of orange juice. Perfect for a quick breakfast or a midday snack, "
                  "this smoothie is not only tasty but also packed with vitamins and energy to "
                  "keep you going throughout the day.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text(
              "Vitamins",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              runSpacing: 10,
              children: const [
                _VitaminInfo(label: 'Protein'),
                _VitaminInfo(label: 'Vitamins'),
                _VitaminInfo(label: 'Fats'),
                _VitaminInfo(label: 'Fiber'),
                _VitaminInfo(label: 'Salt'),
                _VitaminInfo(label: 'Omega-3s'),
                _VitaminInfo(label: 'Vitamin B1'),
                _VitaminInfo(label: 'Vitamin D'),
                _VitaminInfo(label: 'Vitamin E'),
                _VitaminInfo(label: 'Vitamin C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Vitamin Information Widget
class _VitaminInfo extends StatelessWidget {
  final String label;

  const _VitaminInfo({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.blue[50],
      avatar: const Icon(Icons.check_circle, color: Colors.blue, size: 18),
    );
  }
}
