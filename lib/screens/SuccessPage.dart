import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class BackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // The background content (which will be blurred)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Bg.png'), // Your background image
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'This is the background page',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
            ),

            // Blur effect over the background
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10.0, sigmaY: 10.0), // Adjust blur strength
              child: Container(
                color: Colors.black.withOpacity(
                    0.2), // Optional: add a transparent overlay color
              ),
            ),

            // Success Message overlay
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width *
                    0.8, // Make the box responsive
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Stack for overlaying images
                    Stack(
                      alignment: Alignment.center, // Center the images
                      children: [
                        // First Image (Rocket/Illustration)
                        Image.asset(
                          'assets/images/Abstract.png', // Your first rocket image
                        ),

                        // Second Image (overlayed on top)
                        Positioned(
                          top: 10, // Adjust position as needed
                          child: Image.asset(
                            'assets/images/Illustration.png', // Make sure the path and case are correct
                            height: 145, // Adjust the size of the second image
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Text Section
                    Text(
                      'Congratulations!',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),

                    Image.asset(
                      'assets/images/Abstract (1).png', // Your first rocket image
                    ),
                    Text(
                      'Your account has been created',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your login navigation logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 5, 106, 255), // Button background color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(
                              vertical:
                                  10), // Adjusted padding (reduced vertical padding)
                          textStyle: const TextStyle(
                            fontSize:
                                16, // Reduced font size to fit text better
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust radius here
                          ),
                        ),
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
