import 'package:animated_flutter_website/screens/sections/dish_of_the_day.dart';
import 'package:animated_flutter_website/screens/sections/food_row_section.dart';
import 'package:animated_flutter_website/screens/sections/hero_section.dart';
import 'package:animated_flutter_website/widgets/navbar.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            HeroSection(),
            FoodRowSection(),
            DishOfTheDay(),
            // ProjectsSection(),
            // ContactSection(),
          ],
        ),
      ),
    );
  }
}
