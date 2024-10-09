import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});
static const onboardingKey = 'ONBOARDING_KEY';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.18),
            child: Image.asset('assets/images/onboarding3.png'),
          ),
          bottomNavigationBar: Container(
            height: height * 0.38,
            decoration: BoxDecoration(
                color: cubit.isDarkMode ? Colors.black : Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width * 0.05),
                  topLeft: Radius.circular(width * 0.05),
                )),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.circular(width * 0.05)),
                        ),
                        SizedBox(
                          width: width * 0.005,
                        ),
                        Container(
                          height: 4,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.circular(width * 0.05)),
                        ),
                        SizedBox(
                          width: width * 0.005,
                        ),
                        Container(
                          height: 4,
                          width: width * 0.13,
                          decoration: BoxDecoration(
                              color: Kcolor.mainColor,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Text(
                    'Discover the best online course!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignInScreen());
                      Hive.box('onboardingBox').put(onboardingKey, true);
                    },
                    child: Container(
                      height: height * 0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Kcolor.mainColor,
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get started',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 22,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
