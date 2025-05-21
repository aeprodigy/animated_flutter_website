import 'package:animated_flutter_website/widgets/animated_text_line.dart';
import 'package:flutter/material.dart';

class DishOfTheDay extends StatefulWidget {
  const DishOfTheDay({super.key});

  @override
  State<DishOfTheDay> createState() => _DishOfTheDayState();
}

class _DishOfTheDayState extends State<DishOfTheDay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Start animation after build
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          AnimatedTextLine(
            controller: _controller,
            text: "Dish of the Day",
            baseFontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
