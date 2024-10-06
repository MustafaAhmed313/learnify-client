import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/change_pass_screen/change_password.dart';
import 'package:learnify_client/screens/edit_screen/edit_profile.dart';
import 'package:learnify_client/screens/help_center/help_center_screen.dart';

import 'package:learnify_client/screens/setting_content/setting_content_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/setting_screen/models/setting_models.dart';
import 'package:learnify_client/screens/sign_in_screen.dart';

import '../profile_mentor_screen/profile_mentor_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                            "Account",
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
                      model.optionalName ?? "",
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
                onTap: () {
                  Navigator.pop(context);
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
                      onTap: () {
                        Get.to(SignInScreen());
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
          GestureDetector(
            onTap: () {
              Get.to(const ProfileMentorScreen());
            },
            child: Container(
              padding: const EdgeInsets.all(22),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                image: const DecorationImage(
                    image: AssetImage('assets/images/avatar.jpeg'),
                    fit: BoxFit.cover),
              ),
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
                      'example@gmail.com',
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
                      'Ahmed',
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
