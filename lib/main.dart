import 'package:flutter/material.dart';
import 'package:wellnest/dashboad.dart';
import 'package:wellnest/questionary/dietary_preferences_page.dart';
import 'package:wellnest/questionary/gender_page.dart';
import 'package:wellnest/questionary/goals_page.dart';
import 'package:wellnest/questionary/loading_page.dart';
import 'package:wellnest/meal_detail_page.dart';
import 'package:wellnest/questionary/meal_plan_page.dart';
import 'package:wellnest/register/signup_page.dart';
import 'package:wellnest/questionary/weight_height_page.dart';
import 'splash_page.dart';
import 'register/login_page.dart';
import 'questionary/personal_info_page.dart';
import 'questionary/dob_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WellNest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/personal_info': (context) => const PersonalInfoPage(),
        '/dob': (context) => const DobPage(),
        '/gender': (context) => const GenderPage(),
        '/weight_height': (context) => const WeightHeightPage(),
        '/dietary_preferences_page': (context) => DietaryPreferencesPage(),
        '/goals': (context) => GoalsPage(),
        '/loading': (context) => const LoadingPage(),
        '/meal_plan': (context) => const MealPlanPage(),
        '/meal_detail': (context) => const MealDetailPage(),
        '/dashboard': (context) => const DashboardPage(),

      },
    );
  }
}
