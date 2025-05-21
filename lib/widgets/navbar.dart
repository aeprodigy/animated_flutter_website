import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey[100],
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 800;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              //
              Icon(Icons.restaurant, size: 50, color: Colors.grey[600]),
              const Spacer(),

              // Large screen menu
              if (!isSmallScreen)
                Row(
                  children: [
                    _navButton("Home"),
                    const SizedBox(width: 20),
                    _navButton("About"),
                    const SizedBox(width: 20),
                    _navButton("Contact"),
                  ],
                ),

              // Small screen hamburger menu
              if (isSmallScreen)
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _navButton(String label) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
