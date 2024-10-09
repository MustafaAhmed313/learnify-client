import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_client/new_pass_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class VerfiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        final bool isDarkMode = cubit.isDarkMode;

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

              // Foreground Content
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.45, // Takes up 45% of the screen height
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.grey[900]
                          : Colors.white, // Background color changes
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black45
                              : Colors.black26, // Shadow changes
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 120.0, right: 120),
                            child: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Enter Verification code",
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
                          const SizedBox(height: 10),
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              otpBox(isDarkMode),
                              otpBox(isDarkMode),
                              otpBox(isDarkMode),
                              otpBox(isDarkMode),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.20,
                                top: screenHeight * 0.02),
                            child: Row(
                              children: [
                                Text(
                                  "Resend code ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Text(
                                  "00:52s ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.07),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewPassScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(5, 106, 255, 1),
                                foregroundColor:
                                    Colors.white, // Text color remains the same
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10), // Adjusted padding
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Submit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
      },
    );
  }

  Widget otpBox(bool isDarkMode) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterStyle: TextStyle(
            color: isDarkMode? Colors.white : Colors.black
          ),

          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: isDarkMode
                  ? Colors.grey[700]!
                  : Colors.grey, // Border color changes
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
