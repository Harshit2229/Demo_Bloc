import 'package:flutter/material.dart';
import 'package:integrationapi/Screens/user_screen.dart';

import 'crud_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Screen",
          style: TextStyle(color: Colors.white), // Set the text color for the app bar title
        ),
        centerTitle: true, // Center the title
        backgroundColor: Color(0xFF271237), // Set the background color for the app bar
      ),
      body: Container(
        // Apply a gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF271237), Color(0xFF3A1158), Color(0xFF1C0429)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Add an image at the top left (right-facing)
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/img_6.png',
                width: 100,
                height: 100,
              ),
            ),
            // Add the image on top right
            Positioned(
              top: 10,
              right: 0,
              child: Image.asset(
                'assets/images/Vector_1.png',
                width: 100,
                height: 100,
              ),
            ),
            // Add an image at the bottom right (left-facing)
            Positioned(
              bottom: 10,
              right: 5,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14), // Rotate the image 180 degrees (left-facing)
                child: Image.asset(
                  'assets/images/img_1.png',
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/Vector_2.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            // Add the colored lines around the GIF with gradient
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF9A6C), Color(0xFFFCC00FF)], // Desired gradient colors for the top line
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFCC00FF), Color(0xFFFF9A6C)], // Desired gradient colors for the bottom line
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 4,
              bottom: 0,
              width: 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF9A6C), Color(0xFFFCC00FF)], // Desired gradient colors for the left line
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 4,
              bottom: 0,
              width: 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFCC00FF), Color(0xFFFF9A6C)], // Desired gradient colors for the right line
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add the GIF image with color filter
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF3A1158), // Desired color for the GIF
                      BlendMode.color, // Use BlendMode to adjust color behavior
                    ),
                    child: Image.asset(
                      'assets/gifs/Demo_bloc.gif',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add the button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CRUDScreen()),
                      );
                    },
                    child: const Text(
                      "Get Users Detail",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
