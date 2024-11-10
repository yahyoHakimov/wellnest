import 'package:flutter/material.dart';
import 'package:wellnest/product_details.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  // List of image names and titles
  final List<Map<String, String>> _items = const [
    {'image': 'assets/images/chili.png', 'title': 'Chili'},
    {'image': 'assets/images/cofee.png', 'title': 'Coffee'},
    {'image': 'assets/images/cucumber.png', 'title': 'Cucumber'},
    {'image': 'assets/images/egg.png', 'title': 'Egg'},
    {'image': 'assets/images/limon.png', 'title': 'Lemon'},
    {'image': 'assets/images/nutt.png', 'title': 'Nuts'},
    {'image': 'assets/images/optional.png', 'title': 'Optional'},
    {'image': 'assets/images/tomato.png', 'title': 'Tomato'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Shopping list',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return _buildShoppingItem(
              context,
              imageUrl: _items[index]['image']!,
              title: _items[index]['title']!,
            );
          },
        ),
      ),
    );
  }

  // Shopping Item Card
  Widget _buildShoppingItem(BuildContext context, {required String imageUrl, required String title}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailsPage(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
