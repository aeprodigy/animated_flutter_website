import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DishCard extends StatefulWidget {
  final String name;
  final String subName;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const DishCard({
    super.key,
    required this.name,
    required this.subName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationImageReveal;
  late Animation<double> _imageOpacity;

  bool hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animationImageReveal = Tween<double>(begin: 0.0, end: 170.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleVisibility(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !hasAnimated) {
      _controller.forward();
      hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('dish-card-${widget.index}'),
      onVisibilityChanged: _handleVisibility,
      child: Container(
        width: 520.0,
        height: 180.0,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Row(
              children: [
                SizedBox(
                  height: 180.0,
                  width: 180.0,
                  child: Center(
                    child: FadeTransition(
                      opacity: _imageOpacity,
                      child: SizedBox(
                        height: _animationImageReveal.value,
                        width: _animationImageReveal.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.medium,
                            scale: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.montserrat(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        widget.subName,
                        style: GoogleFonts.quicksand(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        widget.description,
                        style: GoogleFonts.quicksand(
                          fontSize: 16.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "\$${widget.price.toStringAsFixed(2)}",
                        style: GoogleFonts.quicksand(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
