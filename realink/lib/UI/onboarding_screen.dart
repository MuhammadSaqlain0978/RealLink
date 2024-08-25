import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Design with Gradient at the top and white at the bottom
            Column(
              children: [
                // Top part with gradient and full image
                Expanded(
                  flex: 3, // Take 3/5th of the screen height for the top part
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(
                                  0xFFFFBE92), // Adjusted peach-orange on the left side
                              Color(
                                  0xFFFEEFEA), // Softer peach towards the center
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      // Full Image Display at the top without distortion
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          'assets/images/house_main.png', // Your house image
                          fit: BoxFit
                              .contain, // Ensure the image fits without distortion
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom part with custom clipped top-left and top-right corners
                Expanded(
                  flex:
                      2, // Take 2/5th of the screen height for the bottom part
                  child: ClipPath(
                    clipper: CircularTopClipper(), // Custom circular clipper
                    child: Container(
                      color: Colors.white, // Solid white background
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Heading text with updated styling, placed inside the white area
                          const Text(
                            "Find Perfect Place\nfor Your Dream",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20), // Spacing before button

                          // Unique button with half-to-half side design
                          Container(
                            width: 250, // Adjust width
                            height: 50, // Adjust height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF875C), // Orange on one side
                                  Color.fromARGB(255, 233, 163,
                                      130), // Lighter orange on the other side
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(25),
                                onTap: () {
                                  // Navigate to Home Screen
                                  GoRouter.of(context).push('/SignUp');
                                },
                                child: const Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20), // Spacing after button

                          // Log in text with gesture detector
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account ? ",
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to Home Screen directly for login
                                  GoRouter.of(context).push('/Login');
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 248, 177,
                                        129), // Matching the orange color for link
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 20), // Add some spacing at the bottom
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper for circular top-left and top-right corners
class CircularTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 50.0; // Adjust the radius as needed

    // Start from top left with a curve
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    // Straight line to top right
    path.lineTo(size.width - radius, 0);

    // Top-right corner curve
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right side down to bottom
    path.lineTo(size.width, size.height);

    // Bottom line to left
    path.lineTo(0, size.height);

    // Left side up to start point
    path.lineTo(0, radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
