import 'package:flutter/material.dart';

class AnimatedTextLine extends StatelessWidget {
  final AnimationController controller;
  final String text;
  final double baseFontSize;
  final FontWeight fontWeight;
  final Color color;
  final Alignment alignment;

  const AnimatedTextLine({
    super.key,
    required this.controller,
    required this.text,
    this.baseFontSize = 24,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.black,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double responsiveFontSize = baseFontSize;

    if (screenWidth < 600) {
      responsiveFontSize = baseFontSize * 0.8;
    } else if (screenWidth > 1200) {
      responsiveFontSize = baseFontSize * 1.2;
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Align(
          alignment: alignment,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - controller.value)),
            child: Opacity(
              opacity: controller.value,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: responsiveFontSize,
                    fontWeight: fontWeight,
                    color: color,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
