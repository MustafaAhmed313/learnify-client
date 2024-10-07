import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_client/screens/verfi_screen.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode or light mode
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/06 Login Filled.png', // Path to your uploaded image
              fit: BoxFit.cover,
            ),
          ),

          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10), // Adjust blur intensity
              child: Container(
                color: isDarkMode
                    ? Colors.black
                        .withOpacity(0.6) // Dark overlay for dark mode
                    : Colors.black
                        .withOpacity(0.3), // Light overlay for light mode
              ),
            ),
          ),

          // Foreground Content placed inside a Container similar to the first uploaded image
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.54, // Takes up 40% of the screen height
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.grey[900]
                      : Colors.white, // Background color changes

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? Colors.black45 // Darker shadow for dark mode
                          : Colors.black26, // Lighter shadow for light mode
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0, right: 120),
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Forget Password",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black, // Text color changes
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Select which contact details should we use to reset your password',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey, // Text color changes
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Card(
                        elevation: 2,
                        color: isDarkMode
                            ? Colors.grey[800]
                            : Colors.white, // Card background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.message,
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black), // Icon color changes
                          title: Text(
                            'Send OTP via SMS',
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black), // Text color changes
                          ),
                          subtitle: Text(
                            '(209) 555-0104',
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey), // Text color changes
                          ),
                          onTap: () {
                            // Handle SMS option
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        elevation: 2,
                        color: isDarkMode
                            ? Colors.grey[800]
                            : Colors.white, // Card background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.email,
                              color: isDarkMode
                                  ? Colors.white
                                  : Colors.black), // Icon color changes
                          title: Text(
                            'Send OTP via Email',
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Colors.black), // Text color changes
                          ),
                          subtitle: Text(
                            'curtis.weaver@example.com',
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey), // Text color changes
                          ),
                          onTap: () {
                            // Handle Email option
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerfiScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkMode
                                ? const Color.fromRGBO(5, 106, 255, 1)
                                : const Color.fromRGBO(5, 106, 255,
                                    1), // Button background color changes
                            foregroundColor:
                                Colors.white, // Text color remains the same
                            padding: const EdgeInsets.symmetric(
                                vertical:
                                    10), // Adjusted padding (reduced vertical padding)
                            textStyle: const TextStyle(
                              fontSize:
                                  16, // Reduced font size to fit text better
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Send Code',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
