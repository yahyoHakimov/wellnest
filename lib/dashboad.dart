import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellnest/profile_page.dart';
import 'package:wellnest/receipe_page.dart';
import 'package:wellnest/shopping_list.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DashboardPageContent(),
    ShoppingListPage(),
    RecipePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Main content for the Home/Dashboard tab
class DashboardPageContent extends StatefulWidget {
  const DashboardPageContent({super.key});

  @override
  _DashboardPageContentState createState() => _DashboardPageContentState();
}

class _DashboardPageContentState extends State<DashboardPageContent> {
  DateTime _selectedDate = DateTime.now();

  void _incrementDate() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  void _decrementDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        _buildHeaderSection(),
        const SizedBox(height: 20),

        // Daily Goals Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Daily Nutrition Goals",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildNutritionRingsSection(),

        // Meal Plan for Today Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Today's Meal Plan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildMealCard(
                mealType: "Breakfast",
                items: ["Oatmeal with Berries", "Greek Yogurt"],
                calories: "350 kcal",
              ),
              _buildMealCard(
                mealType: "Lunch",
                items: ["Grilled Chicken Salad", "Quinoa"],
                calories: "450 kcal",
              ),
              _buildMealCard(
                mealType: "Dinner",
                items: ["Salmon with Veggies", "Brown Rice"],
                calories: "500 kcal",
              ),
              _buildMealCard(
                mealType: "Snacks",
                items: ["Almonds", "Protein Shake"],
                calories: "200 kcal",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Header Section with date navigation
  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFF53CBFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Good Morning,',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.notifications_none, color: Colors.white),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: _decrementDate,
              ),
              Text(
                DateFormat('EEEE, MMM d').format(_selectedDate),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: _incrementDate,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Nutrition Rings Section
  Widget _buildNutritionRingsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildRing("Calories", "1,200 kcal", Colors.orange),
          _buildRing("Proteins", "90g", Colors.blue),
          _buildRing("Carbs", "150g", Colors.green),
          _buildRing("Fats", "50g", Colors.red),
        ],
      ),
    );
  }

  // Build a single ring
  Widget _buildRing(String label, String value, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                value: 0.75,
                strokeWidth: 6,
                backgroundColor: color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }

  // Meal Card
  Widget _buildMealCard({
    required String mealType,
    required List<String> items,
    required String calories,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "• $item",
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text(
              calories,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
