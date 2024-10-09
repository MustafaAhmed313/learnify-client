import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/helpers/hive_helper.dart';
import 'package:learnify_client/screens/bottomNav/bottom_nav.dart';
import 'package:learnify_client/screens/onboarding/onboarding_screen1.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Call the async function here
  }

  // Async function to handle navigation after splash
  Future<void> _navigateToNextScreen() async {
    var box = Hive.box('onboardingBox');
    bool isOnboardingCompleted = box.get('ONBOARDING_KEY', defaultValue: false);

    await Future.delayed(Duration(seconds: 4)); // Wait for 2 seconds

    if (isOnboardingCompleted) {
      if (HiveHelper.checkLoginValue()) {
        final token = HiveHelper.getToken();
        if (token != null && token.isNotEmpty) {
          Get.offAll(() => BottomNav());
        } else {
          Get.offAll(() => SignInScreen());
        }
      } else {
        Get.offAll(() => OnboardingScreen1());
      }
    } else {
      Get.offAll(() => OnboardingScreen1());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash1.png'),
      ),
    );
  }
}
