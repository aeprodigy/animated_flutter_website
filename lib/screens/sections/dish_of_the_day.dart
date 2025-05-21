import 'package:animated_flutter_website/models/dish.dart';
import 'package:animated_flutter_website/widgets/animated_text_line.dart';
import 'package:animated_flutter_website/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DishOfTheDay extends StatefulWidget {
  const DishOfTheDay({super.key});

  @override
  State<DishOfTheDay> createState() => _DishOfTheDayState();
}

class _DishOfTheDayState extends State<DishOfTheDay>
    with SingleTickerProviderStateMixin {
  // Animation controller to control the animation of the text
  late AnimationController _controller;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// / This method is called when the widget is visible on the screen
  /// and triggers the animation.
  void _onVisible() {
    if (!_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // The VisibilityDetector widget is used to detect when the widget is visible
    return VisibilityDetector(
      key: const Key('dish-of-the-day'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.2) {
          _onVisible();
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // The AnimatedTextLine widget is used to display the text with animation
            AnimatedTextLine(
              controller: _controller,
              text: "Dish of the Day",
              baseFontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            //dishes
            const SizedBox(height: 50.0),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 8.0,
              ),
              child: Center(
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 70.0,
                  spacing: 100.0,
                  children:
                      dishes.map<Widget>((dish) {
                        return DishCard(
                          name: dish.name,
                          imageUrl: dish.imageUrl,
                          description: dish.description,
                          price: dish.price,
                          subName: dish.subName,
                          index: dishes.indexOf(dish),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
