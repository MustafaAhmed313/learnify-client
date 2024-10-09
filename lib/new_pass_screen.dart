import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/succss_add_pass_screen.dart';

class NewPassScreen extends StatefulWidget {
  @override
  _NewPassScreenState createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  late TextEditingController _userPasswordController;
  late TextEditingController _reEnterPasswordController; // New controller
  bool _passwordVisible = false;
  bool _rePasswordVisible = false; // New boolean for re-enter password
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userPasswordController =
        TextEditingController(); // Initialize the controller
    _reEnterPasswordController =
        TextEditingController(); // Initialize re-enter controller
    _passwordVisible = false; // Password is initially hidden
    _rePasswordVisible = false; // Re-enter password is initially hidden
  }

  @override
  void dispose() {
    _userPasswordController.dispose(); // Dispose the controller
    _reEnterPasswordController.dispose(); // Dispose re-enter controller
    super.dispose();
  }

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
                  'assets/images/06 Login Filled.png', // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),

              // Blur effect
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.6)
                        : Colors.black.withOpacity(0.3),
                  ),
                ),
              ),

              // Foreground Content
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.55,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode ? Colors.black45 : Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 120.0),
                              child: Divider(
                                  color: Colors.grey), // Divider for aesthetics
                            ),
                            Center(
                              child: Text(
                                "Enter New Password",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Please enter your new password',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:
                                    isDarkMode ? Colors.grey[400] : Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Password",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: _userPasswordController,
                                  obscureText: !_passwordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null; // Valid
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible =
                                              !_passwordVisible; // Change password visibility
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Re-enter Password",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: _reEnterPasswordController,
                                  obscureText: !_rePasswordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please re-enter your password';
                                    }
                                    if (value != _userPasswordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null; // Valid
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'confirm your password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _rePasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _rePasswordVisible =
                                              !_rePasswordVisible; // Change re-enter password visibility
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * .03),
                            SizedBox(
                              height: 46,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SuccssAddPassScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(5, 106, 255, 1),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Change Password',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
