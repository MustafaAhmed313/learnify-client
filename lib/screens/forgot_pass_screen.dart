import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Forgot ',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        TextSpan(
                          text: 'Password',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Please enter your email and we will send",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    " a confirmation code to your email",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: buildIconWithLine(
                            Icons.email_outlined, 'Email', 18,
                            color: Colors.blue, borderColor: Colors.blue)),
                    Expanded(
                        child:
                            buildIconWithLine(Icons.sms_outlined, 'OTP', 18)),
                    Expanded(
                      child:
                          buildIconWithLine(Icons.lock_outline, 'Password', 18),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildStep(true, false),
                      Expanded(
                          child: buildLine(screenWidth * 0.12, Colors.green)),
                      buildStep(false, false),
                      Expanded(
                          child: buildLine(screenWidth * 0.12, Colors.green)),
                      buildStep(false, false),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 48,
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Email ',
                    ),
                  ),
                ),
                SizedBox(
                  height: 235,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 48,
                    width: double.infinity, // Full width
                    child: ElevatedButton(
                      onPressed: () {
                        // Button action here
                        print('Button Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 5, 106, 255), // Button background color
                        foregroundColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(
                            vertical:
                                10), // Adjusted padding (reduced vertical padding)
                        textStyle: const TextStyle(
                          fontSize: 16, // Reduced font size to fit text better
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Adjust radius here
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize:
                                  16, // Keep the size a bit smaller to fit
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Don't have an acount? ",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                    Icon(
                      Icons.north_east,
                      color: Colors.blue,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconWithLine(
    IconData icon,
    String label,
    double screenWidth, {
    Color color = Colors.black,
    Color borderColor = Colors.grey,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8), // Padding inside the border
          decoration: BoxDecoration(
            border: Border.all(
                color: borderColor, width: 2), // Border color and width
            borderRadius:
                BorderRadius.circular(4), // Rounded corners (optional)
          ),
          child: Icon(icon,
              size: 30, color: color), // Icon with customizable color
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12, // Fixed font size for the label
            color: color, // Set color if needed
          ),
        ),
      ],
    );
  }

  Widget buildStep(bool isActive, bool isCompleted) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: isActive
          ? (isCompleted
              ? const Color.fromARGB(255, 121, 243, 125).withOpacity(0.2)
              : Colors.blue.withOpacity(0.2))
          : Colors.grey.withOpacity(0.2),
      child: isCompleted
          ? const Icon(Icons.check, color: Color.fromARGB(255, 74, 222, 128))
          : (isActive
              ? const Icon(Icons.circle, color: Colors.blue)
              : const SizedBox()),
    );
  }

  Widget buildLine(double width, Color color) {
    return Container(
      height: 2,
      width: width,
      color: color,
    );
  }
}
