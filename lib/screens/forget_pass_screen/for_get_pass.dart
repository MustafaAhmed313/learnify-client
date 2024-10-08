import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Keeping the Bloc import
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_client/screens/verfi_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  heightFactor: 0.54,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 120.0),
                            child: Divider(color: Colors.grey),
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: Text(
                              "Forgot Password",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Select which contact details should we use to reset your password',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? Colors.grey[400] : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          _buildContactOption(
                            context,
                            icon: Icons.message,
                            title: 'Send OTP via SMS',
                            subtitle: '(209) 555-0104',
                            isDarkMode: isDarkMode,
                            onTap: () {
                              // Handle SMS option
                            },
                          ),
                          SizedBox(height: 10),
                          _buildContactOption(
                            context,
                            icon: Icons.email,
                            title: 'Send OTP via Email',
                            subtitle: 'curtis.weaver@example.com',
                            isDarkMode: isDarkMode,
                            onTap: () {
                              // Handle Email option
                            },
                          ),
                          SizedBox(height: 30),
                          _buildSendCodeButton(context, isDarkMode),
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

  Widget _buildContactOption(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required bool isDarkMode,
      required VoidCallback onTap}) {
    return Card(
      elevation: 2,
      color: isDarkMode ? Colors.grey[800] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
        title: Text(
          title,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isDarkMode ? Colors.grey[400] : Colors.grey,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSendCodeButton(BuildContext context, bool isDarkMode) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerfiScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(5, 106, 255, 1),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text(
          'Send Code',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
