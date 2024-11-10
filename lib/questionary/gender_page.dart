import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF5A99D3),
                  Color(0xFFB3E5FC),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Animated Progress Indicator
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                width: index == 2 ? 32 : 24, // Highlight current step
                                height: 6,
                                decoration: BoxDecoration(
                                  color: index == 2
                                      ? Colors.lightBlue
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Title and Subtitle
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Choose your gender.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Gender Selection Cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildGenderCard(
                              label: 'Male',
                              icon: Icons.male,
                              isSelected: selectedGender == 'Male',
                              onTap: () {
                                setState(() {
                                  selectedGender = 'Male';
                                });
                              },
                            ),
                            _buildGenderCard(
                              label: 'Female',
                              icon: Icons.female,
                              isSelected: selectedGender == 'Female',
                              onTap: () {
                                setState(() {
                                  selectedGender = 'Female';
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildActionButton(
                              label: 'Back',
                              onPressed: () {
                                Navigator.pop(context); // Handle back navigation
                              },
                              backgroundColor: Colors.white,
                              textColor: Colors.lightBlue,
                              borderColor: Colors.lightBlue,
                            ),
                            _buildActionButton(
                              label: 'Continue',
                              onPressed: () {
                                Navigator.pushNamed(context, '/weight_height');
                              },
                              backgroundColor: Colors.lightBlue,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Gender Card with interactive design
  Widget _buildGenderCard({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue.withOpacity(0.2) : Colors.white,
          border: Border.all(
              color: isSelected ? Colors.lightBlue : Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.lightBlue.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Column(
          children: [
            Icon(icon, size: 48, color: Colors.lightBlue),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Action Buttons with customizable styles
  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: borderColor != null
              ? BorderSide(color: borderColor)
              : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        elevation: borderColor != null ? 0 : 5,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
