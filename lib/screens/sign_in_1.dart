import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn1 extends StatelessWidget {
  const SignIn1({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                          text: 'Welcome ',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: screenWidth *
                                    0.06, // Dynamically sized text
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        TextSpan(
                          text: 'to Learnify',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: screenWidth *
                                    0.06, // Dynamically sized text
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
                      textStyle: TextStyle(
                          fontSize:
                              screenWidth * 0.035, // Dynamically sized text
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    " a confirmation code to your email",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize:
                              screenWidth * 0.035, // Dynamically sized text
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
                        child: buildIconWithLine(Icons.email_outlined, 'Email',
                            screenWidth * 0.9, // Adjusted for screen size
                            color: Colors.blue,
                            borderColor: Colors.blue)),
                    Expanded(
                        child: buildIconWithLine(
                            Icons.sms_outlined, 'OTP', screenWidth * 0.9)),
                    Expanded(
                        child: buildIconWithLine(
                            Icons.lock_outline, 'Password', screenWidth * 0.9)),
                    Expanded(
                        child: buildIconWithLine(Icons.person_outlined,
                            "information", screenWidth * 0.9)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildStep(true, false),
                    SizedBox(
                      width: screenWidth * 0.03, // Dynamically adjust spacing
                    ),
                    Expanded(
                      child: buildLine(screenWidth * 0.12, Colors.grey),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    buildStep(false, false),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: buildLine(screenWidth * 0.12, Colors.grey),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    buildStep(false, false),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    Expanded(
                      child: buildLine(screenWidth * 0.12, Colors.grey),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    buildStep(false, false),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: screenWidth * 0.045, // Dynamically sized text
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: screenWidth * 0.035,
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
                  height: screenHeight * 0.20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: screenHeight * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button Pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 5, 106, 255),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: screenWidth * 0.045,
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
                          textStyle: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                    Icon(
                      Icons.north_east,
                      color: Colors.blue,
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey, thickness: 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Create your account quickly with"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey, thickness: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.apple,
                          size: screenWidth * 0.08,
                        ),
                      ),
                    ),
                  ],
                ),
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
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, size: screenWidth * 0.08, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.03,
            color: color,
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
