import 'package:flutter/material.dart';

class WeightHeightPage extends StatefulWidget {
  const WeightHeightPage({super.key});

  @override
  _WeightHeightPageState createState() => _WeightHeightPageState();
}

class _WeightHeightPageState extends State<WeightHeightPage> {
  double _weight = 65.0;
  double _height = 165.0;

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
                  Color(0xFF72C0E4),
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
                        // Enhanced Progress Indicator with Animation
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                                width: 24,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: index == 3
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
                                'Weight and Height',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Choose your weight and height.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Weight Selector
                        const Text(
                          'Weight (kg)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Slider(
                                  value: _weight,
                                  min: 40,
                                  max: 150,
                                  divisions: 110,
                                  label: _weight.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _weight = value;
                                    });
                                  },
                                ),
                                Center(
                                  child: Text(
                                    '${_weight.round()} kg',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Height Selector
                        const Text(
                          'Height (cm)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Slider(
                                  value: _height,
                                  min: 100,
                                  max: 250,
                                  divisions: 150,
                                  label: _height.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _height = value;
                                    });
                                  },
                                ),
                                Center(
                                  child: Text(
                                    '${_height.round()} cm',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                Navigator.pushNamed(
                                    context, '/dietary_preferences_page');
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
