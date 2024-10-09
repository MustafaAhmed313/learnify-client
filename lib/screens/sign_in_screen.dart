import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnify_client/cubit/login_cubit.dart';
import 'package:learnify_client/helpers/hive_helper.dart';
import 'package:learnify_client/screens/bottomNav/bottom_nav.dart';
import 'package:learnify_client/screens/forget_pass_screen/for_get_pass.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/sign_in_1.dart';
import 'package:learnify_client/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _userPasswordController;
  bool _passwordVisible = false;

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    _emailController.dispose(); // Dispose email controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErorrState) {
            Get.snackbar(
              "Error",
              state.msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else if (state is LoginSuccessState) {
            Get.snackbar(
              "Success",
              state.msge,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
          }
        },
        child: BlocBuilder<SwitchCubit, SwitchState>(
          builder: (context, state) {
            final cubit = context.read<SwitchCubit>();
            return Scaffold(
              backgroundColor:
                  cubit.isDarkMode ? const Color(0xff151515) : Colors.white,
              appBar: AppBar(
                backgroundColor:
                    cubit.isDarkMode ? const Color(0xff151515) : Colors.white,
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
                        child: GestureDetector(
                          onTap: () {
                            Get.to(const BottomNav());
                          },
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
                    ),
                  )
                ],
              ),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
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
                                            color: cubit.isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'back',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
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
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.02),
                                  child: Text(
                                    "Please enter your email & password.",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
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
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.02),
                                  child: Text(
                                    "to access your account",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
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
                        const SizedBox(height: 20),
                        Align(

                          alignment: Alignment.centerLeft,
                          child: Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(
                            "Email",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: cubit.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),),
                        ),
                        SizedBox(
                            height: 48,
                            child: TextField(
                              controller: _emailController,
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Rounded border
                                  borderSide: const BorderSide(
                                    color: Colors.grey, // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                              ),
                            ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(padding: const EdgeInsets.only(bottom: 10), child:Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: cubit.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(
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
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Rounded border
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
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_box_outline_blank,
                              size: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              "Remember Me",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                            SizedBox(
                              width: screenWidth * .18,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 48,
                            width: double.infinity, // Full width
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginCubit>().login(
                                          email: _emailController.text,
                                          password:
                                              _userPasswordController.text);
                                      HiveHelper.setValueLoginBox();
                                    }
                                    // Button action here
                                    print('Button Pressed');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 5, 106, 255),
                                    foregroundColor: Colors.white, // Text color
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "Don't have an account? ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                            Padding(
                              padding: const EdgeInsets.only(left: 35.0),
                              child: Text(
                                "Don't have an account? ",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.north_east,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                            SizedBox(width: 10),
                            Text("Log in with"),
                            SizedBox(width: 10),
                            Expanded(
                              child: Divider(color: Colors.grey, thickness: 1),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Space icons evenly
                          children: [
                            // Google Icon with border
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
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
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0),
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
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(
                                  Icons.apple,
                                  color: cubit.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
