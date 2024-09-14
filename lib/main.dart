import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/screens/help_center/cubit/help_center_cubit.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/setting_screen/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchCubit(),
        ),
        BlocProvider(
          // Pass `this` as the TickerProvider to HelpCenterCubit
          create: (context) => HelpCenterCubit(this),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SettingScreen(),
      ),
    );
  }
}
