import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/change_pass_screen/cubit/validate_password_cubit.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({
    super.key,
  });

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatePasswordCubit, ValidatePasswordState>(
      builder: (context, state) {
        final cubit = context.read<ValidatePasswordCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Change Password',
              style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF92929D)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: Color(0xFF92929D),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Old password',
                            style: TextStyle(
                              color: Color(0xFF92929D),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Kcolor.mainColor),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: Kcolor.mainColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'New Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF1FFE9),
                        radius: 12,
                        child: Icon(
                          Icons.check,
                          color: Color(0xff4ADE80),
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 260,
                        height: 3,
                        color: Color(0xff4ADE80),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xFFACCDFF),
                        radius: 10,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Kcolor.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                          color: Color(0xFF030303),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: cubit.passwordController,
                        obscureText: cubit.newPass,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.newPassIcon();
                            },
                            child: Icon(
                              cubit.newPass
                                  ? Icons.remove_red_eye_outlined
                                  : CupertinoIcons.eye_slash,
                              color: Color(0xFF92929D),
                            ),
                          ),
                          hintText: 'Enter Your New Password',
                          hintStyle: TextStyle(color: Color(0xFF92929D)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF92929D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm New Password',
                        style: TextStyle(
                          color: Color(0xFF030303),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: cubit.confirmPasswordController,
                        obscureText: cubit.obscureText,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              cubit.confirmPassIcon();
                            },
                            child: Icon(
                              cubit.obscureText
                                  ? Icons.remove_red_eye_outlined
                                  : CupertinoIcons.eye_slash,
                              color: Color(0xFF92929D),
                            ),
                          ),
                          hintText: 'Enter Your Confirm New Password',
                          hintStyle: TextStyle(color: Color(0xFF92929D)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF92929D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Validation checks UI
                      _buildValidationItem(cubit.isLengthValid,
                          'Min 8 characters', cubit.isInitial),
                      _buildValidationItem(cubit.passwordsMatch,
                          'The 2 passwords are the same', cubit.isInitial),
                      _buildValidationItem(cubit.hasUpperCase,
                          'At least one Case Character', cubit.isInitial),
                      _buildValidationItem(cubit.hasLowerCase,
                          'At least one Lower Case Character', cubit.isInitial),
                      _buildValidationItem(cubit.hasNumber,
                          'At least one Numeric Character', cubit.isInitial),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 140),
                  child: Container(
                    width: 370,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: Color(0xFF056AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildValidationItem(bool isValid, String text, bool isInitial) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            isInitial
                ? Icons.check_circle_outline
                : (isValid ? Icons.check_circle : Icons.check_circle),
            size: 35,
            color:
                isInitial ? Colors.grey : (isValid ? Colors.green : Colors.red),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: isInitial
                  ? Colors.grey
                  : (isValid ? Colors.green : Colors.red),
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
