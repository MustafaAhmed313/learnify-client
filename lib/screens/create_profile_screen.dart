import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Getting screen height and width using MediaQuery for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Action when the back button is pressed
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // Padding based on screen width
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
                                  text: 'Create ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth *
                                          0.06, // Responsive font size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Profile',
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
                              "Please enter your data and you can change it again from settings",
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
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildIconWithLine(
                                Icons.email_outlined, 'Email', screenWidth),
                            buildIconWithLine(
                                Icons.sms_outlined, 'OTP', screenWidth),
                            buildIconWithLine(
                                Icons.lock_outline, 'Password', screenWidth),
                            buildIconWithLine(Icons.person_outlined,
                                'Information', screenWidth,
                                color: Colors.blue, borderColor: Colors.blue),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildStep(true, true),
                            Expanded(
                                child: buildLine(
                                    screenWidth * 0.12, Colors.green)),
                            buildStep(true, true),
                            Expanded(
                                child: buildLine(
                                    screenWidth * 0.12, Colors.green)),
                            buildStep(true, true),
                            Expanded(
                                child: buildLine(
                                    screenWidth * 0.12, Colors.green)),
                            buildStep(true, false),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                      SizedBox(width: 85),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.13),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 48,
                          child: TextField(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your Name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Phone Number",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 48,
                          child: TextField(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Confirm your Phone Number',
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              // Button action here
                              print('Button Pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 5, 106, 255),
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
                              'Get started',
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
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: screenHeight * 0.34,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.14,
                          backgroundColor: Colors.grey[200],
                          child: CircleAvatar(
                            radius: screenWidth * 0.13,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person_outlined,
                              size: screenWidth * 0.13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: screenWidth * 0.02,
                          right: screenWidth * 0.02,
                          child: CircleAvatar(
                            radius: screenWidth * 0.03,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Add Photo',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'This will be your photo',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
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
