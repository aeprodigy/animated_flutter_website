import 'package:flutter/material.dart';

class FoodRowSection extends StatelessWidget {
  FoodRowSection({super.key});

  final List<String> imageLinks = [
    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1432139555190-58524dae6a55?q=80&w=2076&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 800;

    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: Colors.grey[100],
          child: Column(
            children: [
              Center(
                child: Text(
                  "Healthy Recipes",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Discover a variety of healthy recipes to nourish your body and mind.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w200,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          color: Colors.grey[100],
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child:
                  isSmallScreen
                      ? Column(
                        children:
                            imageLinks
                                .map(
                                  (url) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: foodItem(url),
                                  ),
                                )
                                .toList(),
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            imageLinks
                                .map(
                                  (url) => Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: foodItem(url),
                                  ),
                                )
                                .toList(),
                      ),
            ),
          ),
        ),
      ],
    );
  }

  Widget foodItem(String imageUrl) {
    return SizedBox(
      height: 230,
      width: 290,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
