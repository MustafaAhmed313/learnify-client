import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/cubit/login_cubit.dart';
import 'package:learnify_client/helpers/hive_helper.dart';
import 'package:learnify_client/language_cubit/language_cubit.dart';
import 'package:learnify_client/screens/change_pass_screen/change_password.dart';
import 'package:learnify_client/screens/edit_screen/edit_profile.dart';
import 'package:learnify_client/screens/help_center/help_center_screen.dart';

import 'package:learnify_client/screens/setting_content/setting_content_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/setting_screen/models/setting_models.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learnify_client/screens/sign_up_screen/register_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Container(
                  width: 390,
                  height: 54,
                  child: Row(
                    children: [
                      if (!cubit.isSearching)
                        Padding(
                          padding: const EdgeInsets.only(left: 135.0),
                          child: Text(
                            AppLocalizations.of(context)!.account,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: TextField(
                            controller: cubit.searchController,
                            onChanged: cubit.filteredSearchResults,
                            decoration: InputDecoration(
                              hintText: "Search...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          cubit.searchBoutton();
                        },
                        child: Icon(
                          cubit.isSearching ? Icons.close : Icons.search,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _personInfo(),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 10),
                  itemBuilder: (c, i) => _settingBody(cubit.filteredSetting[i]),
                  separatorBuilder: (c, i) => Divider(
                    indent: 25,
                    endIndent: 25,
                  ),
                  itemCount: cubit.filteredSetting.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Padding _settingBody(SettingModels model) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          final cubit = context.read<SwitchCubit>();
          return GestureDetector(
            onTap: () {
              if (model.name == 'Help Center') {
                Get.to(HelpCenterScreen());
              } else if (model.name == 'Setting') {
                Get.to(SettingContentScreen());
              } else if (model.name == 'Edit Profile') {
                Get.to(EditProfile());
              } else if (model.name == 'Change password') {
                Get.to(ChangePassword());
              } else if (model.name == 'Logout') {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildLogout(context);
                    });
              } else if (model.name == 'Language') {
                _showLanguageDialog(
                    context); // عرض القائمة عند الضغط على السهم بجوار اللغة
              }
            },
            child: Container(
              width: 354,
              height: 70,
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: model.name == 'Logout'
                          ? const Color.fromARGB(43, 255, 19, 2)
                          : Color(0x19056AFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Icon(
                      model.icon,
                      color: model.name == 'Logout'
                          ? Colors.red
                          : Kcolor.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (model.name == 'Logout')
                    Text(
                      model.name!,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else
                    Text(
                      model.name!,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  Spacer(),
                  if (model.optionalName != null &&
                      model.optionalName!.isNotEmpty)
                    Text(
                      model.name == 'Dark Mode'
                          ? model.optionalName ?? ""
                          : _selectedLanguage,
                      style: TextStyle(
                        color: Color(0xFF92929D),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  SizedBox(
                    width: 7,
                  ),
                  if (model.name == "Dark Mode")
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: cubit.isDarkMode,
                        activeColor: Colors.blue,
                        trackColor: Colors.grey,
                        onChanged: (bool value) {
                          cubit.changeSwitch(model, value);
                        },
                      ),
                    )
                  else if (model.name == 'Logout')
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.red,
                      size: 20,
                    )
                  else
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Kcolor.mainColor,
                      size: 20,
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedLanguage,
                items: <String>['English', 'Arabic'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue ?? 'English';
                    if (LanguageCubit.isArabic) {
                      context.read<LanguageCubit>().toEnglish();
                    } else {
                      context.read<LanguageCubit>().toArabic();
                    }
                  });
                  Navigator.pop(context); // إغلاق الـ Dialog بعد الاختيار
                },
              ),
            ],
          ),
        );
      },
    );
  }

  BackdropFilter _buildLogout(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
      child: AlertDialog(
        backgroundColor: Color(0xFFFCFCFC),
        content: Container(
          width: 354,
          height: 339,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFFCFCFC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/tick 1 (2).png'),
              Text(
                'Logout?!',
                style: TextStyle(
                  color: Color(0xFFFF3333),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Are you sure you want to logout?',
                style: TextStyle(
                  color: Color(0xFF92929D),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 318,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: Color(0xFF056AFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
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
              GestureDetector(
                onTap: () async {
                  await HiveHelper.deleteToken();
                  Get.offAll(() => SignInScreen());
                },
                child: Container(
                  width: 318,
                  height: 48,
                  padding: const EdgeInsets.all(12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF056AFF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        HiveHelper.deleteToken();
                        Get.offAll(SignInScreen());
                      },
                      child: Text(
                        'Yes,Logout',
                        style: TextStyle(
                          color: Color(0xFF056AFF),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _personInfo() {
    final registerCubit = context.read<RegisterCubit>();

    final loginCubit = context.read<LoginCubit>();
    var box = Hive.box('USER_BOX');
    String? username = box.get('username', defaultValue: loginCubit.username);
    String? email = box.get('email', defaultValue: registerCubit.email);
    return Container(
      width: 370,
      height: 80,
      padding: const EdgeInsets.all(13),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF92929D)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              image: const DecorationImage(
                  image: AssetImage('assets/images/OIP.jfif'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          Container(
            width: 232,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 28,
                  child: SizedBox(
                    width: 232,
                    child: Text(
                      '${email ?? "example@gmail.com"}',
                      style: TextStyle(
                        color: Color(0xFF92929D),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    width: 91.58,
                    child: Text(
                      '${username ?? "guest"}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.edit,
            color: Kcolor.mainColor,
          )
        ],
      ),
    );
  }
}
