import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Enter Verification ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth * 0.07,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Code',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth * 0.06,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.02),
                            child: Text(
                              "We’ve sent an OTP code to your Email ",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "xxxxx@example.com ",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildIconWithLine(
                                  Icons.email_outlined, 'Email', screenWidth),
                              buildIconWithLine(
                                  Icons.sms_outlined, 'OTP', screenWidth),
                              buildIconWithLine(
                                  Icons.lock_outline, 'Password', screenWidth),
                              buildIconWithLine(Icons.person_outline,
                                  'Password', screenWidth),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildStep(true, true),
                              Expanded(
                                  child: buildLine(
                                      screenWidth * 0.12, Colors.green)),
                              buildStep(true, false),
                              Expanded(
                                  child: buildLine(
                                      screenWidth * 0.12, Colors.grey)),
                              buildStep(false, false),
                              Expanded(
                                  child: buildLine(
                                      screenWidth * 0.12, Colors.grey)),
                              buildStep(false, false),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            otpBox(),
                            otpBox(),
                            otpBox(),
                            otpBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Text(
                          "The code will expire ",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "( 02m 00s ) ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Text(
                        "Resend",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * .23,
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
                            fontSize:
                                16, // Reduced font size to fit text better
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust radius here
                          ),
                        ),
                        child: Text(
                          'Verify',
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
                          "Already have an acount? ",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Text(
                        "Sign in",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget otpBox() {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.blue, width: 3),
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
          padding: EdgeInsets.all(screenWidth * 0.02),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, size: screenWidth * 0.08, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: screenWidth * 0.03),
        ),
        const SizedBox(height: 5),
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
