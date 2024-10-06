import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:learnify_client/screens/Congratulation_screen.dart';
import 'package:learnify_client/screens/SuccessPage.dart';
import 'package:learnify_client/screens/Verification_screen1.dart';
import 'package:learnify_client/cubit/login_cubit.dart';
import 'package:learnify_client/helpers/dio_helper.dart';
import 'package:learnify_client/helpers/hive_helper.dart';

import 'package:learnify_client/screens/change_pass_screen/cubit/validate_password_cubit.dart';

import 'package:learnify_client/screens/help_center/cubit/help_center_cubit.dart';
import 'package:learnify_client/screens/home_screen/cubit/carousel_cubit.dart';
import 'package:learnify_client/screens/profile_mentor_screen/cubit/tab_change_cubit.dart';

import 'package:learnify_client/screens/setting_content/cubit/setting_content_cubit.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';

const darkModeBox = 'darkModeTutorial';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);
    await Hive.openBox('LOGIN_BOX');
  await Hive.openBox(HiveHelper.token);

    DioHelper.inint();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final lightTheme =
      ThemeData(brightness: Brightness.light, fontFamily: 'Poppins'
          // primaryColor: Colors.blue,
          );

  final darkTheme = ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'
      // primaryColor: Colors.grey,
      );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider(
          create: (context) => HelpCenterCubit(this),
        ),
        BlocProvider(
          create: (context) => SettingContentCubit(),
        ),
        BlocProvider(
          create: (context) => ValidatePasswordCubit(),
        ),
        BlocProvider(
          create: (context) => TabChangeCubit(),
        ),
        BlocProvider(
          create: (context) => CarouselCubit(),
        ),
                BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          final isDarkMode = context.read<SwitchCubit>().getDarkMode();
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme, // Light theme
            darkTheme: darkTheme, // Dark theme
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: SignInScreen(),
          );
        },
      ),
    );
  }

}
