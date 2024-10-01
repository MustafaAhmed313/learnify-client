import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _userPasswordController;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _userPasswordController =
        TextEditingController(); // Initialize the controller
    _passwordVisible = false; // Password is initially hidden
  }

  @override
  void dispose() {
    _userPasswordController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 10),
            child: Container(
              width: 70,
              height: 50,
              margin: const EdgeInsets.only(bottom: 15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  'guest',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
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
                              text: 'Welcome ',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: 'back',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
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
                          "Please enter your email & password.",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Text(
                          "to access your account",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Email",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded border
                        borderSide: const BorderSide(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 48,
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    controller: _userPasswordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded border
                        borderSide: const BorderSide(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_box_outline_blank,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Remember Me",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * .18,
                  ),
                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                  ),
                ],
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
                      'Login',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16, // Keep the size a bit smaller to fit
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
              ),
              SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Log in with"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Space icons evenly
                children: [
                  // Google Icon with border
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red, // You can adjust the color if needed
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacing between icons
                  // Facebook Icon with border
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacing between icons
                  // Apple Icon with border
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      child: Icon(
                        Icons.apple,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
