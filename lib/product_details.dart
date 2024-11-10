import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

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
          'About cucumber',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enjoy a refreshing salad that showcases the crispness of cucumbers, complemented by a vibrant mix of fresh greens, perfectly sliced hard-boiled eggs, and juicy cherry tomatoes, all drizzled with a zesty light vinaigrette.",
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
