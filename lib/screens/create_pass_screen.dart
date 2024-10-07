import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassScreen extends StatelessWidget {
  const CreatePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.01), // Dynamic spacing
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Create a ',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.06, // Dynamic font size
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: 'Password',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.06, // Dynamic font size
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // Dynamic spacing
                    Center(
                      child: Text(
                        "Set a strong password to keep your account secure",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.04, // Dynamic font size
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Dynamic spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildIconWithLine(Icons.email_outlined, 'Email',
                            screenWidth, screenHeight), // 4 arguments
                        buildIconWithLine(Icons.sms_outlined, 'OTP',
                            screenWidth, screenHeight), // 4 arguments
                        buildIconWithLine(Icons.lock_outline, 'Password',
                            screenWidth, screenHeight,
                            color: Colors.blue,
                            borderColor: Colors.blue), // 4 arguments
                        buildIconWithLine(Icons.person_outlined, 'Information',
                            screenWidth, screenHeight), // 4 arguments
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02), // Dynamic spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildStep(true, true), // Step 1 completed
                        Expanded(
                            child: buildLine(screenWidth * 0.2,
                                Colors.green)), // Dynamic line width
                        buildStep(true, true), // Step 2 completed
                        Expanded(
                            child: buildLine(screenWidth * 0.2,
                                Colors.green)), // Dynamic line width
                        buildStep(true, false), // Step 3 in progress
                        Expanded(
                            child: buildLine(screenWidth * 0.2,
                                Colors.grey)), // Dynamic line width
                        buildStep(false, false), // Step 4 not started
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04), // Dynamic spacing
                    Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.045, // Dynamic font size
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: screenHeight * 0.01), // Dynamic spacing
                          SizedBox(
                            height: screenHeight *
                                0.06, // Dynamic height for text field
                            child: TextField(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.035, // Dynamic font size
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Password',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: screenHeight * 0.01), // Dynamic spacing
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Confirm Password",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.045, // Dynamic font size
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: screenHeight * 0.01), // Dynamic spacing
                          SizedBox(
                            height: screenHeight *
                                0.06, // Dynamic height for text field
                            child: TextField(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize:
                                      screenWidth * 0.035, // Dynamic font size
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm your Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Dynamic spacing
                    Column(
                      children: [
                        _buildPasswordRequirementRow(Icons.check_circle_outline,
                            "Min 8 characters", Colors.grey),
                        SizedBox(
                          height: 5,
                        ),
                        _buildPasswordRequirementRow(Icons.check_circle_outline,
                            "The 2 passwords are the same", Colors.grey),
                        SizedBox(
                          height: 5,
                        ),
                        _buildPasswordRequirementRow(Icons.check_circle,
                            "At least one case character", Colors.red),
                        SizedBox(
                          height: 5,
                        ),
                        _buildPasswordRequirementRow(Icons.check_circle,
                            "At least one case character", Colors.green),
                        SizedBox(
                          height: 5,
                        ),
                        _buildPasswordRequirementRow(Icons.check_circle,
                            "At least one numeric character", Colors.green),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.001), // Dynamic spacing
                    Padding(
                      padding:
                          EdgeInsets.all(screenWidth * 0.01), // Dynamic padding
                      child: SizedBox(
                        height: screenHeight * 0.06, // Dynamic button height
                        width: double.infinity, // Full width
                        child: ElevatedButton(
                          onPressed: () {
                            // Button action here
                            print('Create Password button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 5, 106, 255),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.04, // Dynamic font size
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Adjust radius
                            ),
                          ),
                          child: Text(
                            'Create Password',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create an icon with a label underneath
  // Function to create an icon with a label underneath
  Widget buildIconWithLine(
      IconData icon,
      String label,
      double screenWidth, // Keep this parameter
      double screenHeight, // Add this parameter
      {Color color = Colors.black,
      Color borderColor = Colors.grey}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02), // Dynamic padding
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon,
              size: screenWidth * 0.07, color: color), // Dynamic icon size
        ),
        SizedBox(height: screenHeight * 0.01), // Dynamic spacing
        Text(
          label,
          style: TextStyle(
              fontSize: screenWidth * 0.035, color: color), // Dynamic font size
        ),
      ],
    );
  }

  Widget buildStep(bool isActive, bool isCompleted) {
    return CircleAvatar(
      radius: 14,
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
      width: width, // Dynamic line width
      color: color,
    );
  }

  Widget _buildPasswordRequirementRow(
      IconData icon, String label, Color color) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
