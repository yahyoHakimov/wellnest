import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              const SizedBox(height: 16),

              // Name and Bio
              const Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Edit and Settings Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileButton(Icons.edit, 'Edit Profile'),
                  const SizedBox(width: 16),
                  _buildProfileButton(Icons.settings, 'Settings'),
                ],
              ),
              const SizedBox(height: 30),

              // Progress Section: Circular Progress Indicators
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Today's Progress",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 20),
              _buildProgressSection(),

              const SizedBox(height: 30),

              // Motivational Quote or Goal Tracker
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Goal for Today",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Reach your goal of 2000 kcal intake and 10,000 steps today!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
              const SizedBox(height: 30),

              // About Me Section
              _buildSectionTitle('About Me'),
              const SizedBox(height: 10),
              const Text(
                "Enthusiastic Flutter developer with a passion for creating beautiful, user-friendly applications.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Personal Information
              _buildSectionTitle('Personal Information'),
              const SizedBox(height: 10),
              _buildInfoRow(Icons.email, 'Email', 'johndoe@example.com'),
              const SizedBox(height: 10),
              _buildInfoRow(Icons.phone, 'Phone', '+123 456 7890'),
              const SizedBox(height: 10),
              _buildInfoRow(Icons.location_on, 'Location', 'New York, USA'),
              const SizedBox(height: 10),
              _buildInfoRow(Icons.cake, 'Birthday', 'Jan 1, 1990'),
            ],
          ),
        ),
      ),
    );
  }

  // Button Widget
  Widget _buildProfileButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Progress Section
  Widget _buildProgressSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCircularProgress("Calories", 0.75, Colors.red),
        _buildCircularProgress("Steps", 0.65, Colors.green),
        _buildCircularProgress("Workouts", 0.80, Colors.blue),
      ],
    );
  }

  // Circular Progress Indicator Widget
  Widget _buildCircularProgress(String label, double progress, Color color) {
    return Column(
      children: [
        CircularProgressIndicator(
          value: progress,
          strokeWidth: 6,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Information Row Widget
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
