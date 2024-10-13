import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify_client/cubit/login_cubit.dart';
import 'package:learnify_client/helpers/hive_helper.dart';
import 'package:learnify_client/screens/bottomNav/bottom_nav.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';
import 'package:learnify_client/screens/sign_up_screen/register_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegisterErrorState) {
            Get.snackbar(
              "Error",
              state.msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else if (state is RegisterSuccessState) {
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
                                        text: 'Register ',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                              color: cubit.isDarkMode
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'now!',
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
                                    "Please enter your personal information",
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
                                    "to create your account",
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
                            "Name",
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
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your Name',
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
                          child: Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(
                            "Phone Number",
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
                            keyboardType: TextInputType.number,
                            controller: _phoneNumberController,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter your Phone Number',
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
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 48,
                            width: double.infinity, // Full width
                            child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                                if (state is RegisterLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<RegisterCubit>().Register(
                                            
                                              phone: _phoneNumberController.text,
                                              username: _nameController.text,
                                              email: _emailController.text,
                                              password:
                                              _userPasswordController.text
                                          );
                                          setState(() {
                                            HiveHelper.setValueLoginBox();
                                          });
                                        }
                                        // Button action here
                                        print('Button Pressed');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(255,
                                            5, 106, 255), // Button background color
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
                                        'Register',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize:
                                              16, // Keep the size a bit smaller to fit
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<LoginCubit>().login(
                                              email: _emailController.text,
                                              password:
                                              _userPasswordController.text);
                                          setState(() {
                                            HiveHelper.setValueLoginBox();
                                          });
                                        }
                                        // Button action here
                                        print('Button Pressed');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red, // Button background color
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
                                        'Google',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize:
                                              16, // Keep the size a bit smaller to fit
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You have an account? ",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const SignInScreen());
                              },
                              child: Text(
                                "Sign In",
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
                            )
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