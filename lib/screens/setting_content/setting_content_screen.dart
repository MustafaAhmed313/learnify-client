import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/cubit/login_cubit.dart';
import 'package:learnify_client/screens/about_us_screen/about_us.dart';
import 'package:learnify_client/screens/manage_notification_screen/manage_notification.dart';
import 'package:learnify_client/screens/setting_content/cubit/setting_content_cubit.dart';
import 'package:learnify_client/screens/setting_content/models/setting_content_model.dart';
import 'package:learnify_client/screens/setting_content/widget/rate_dialog.dart';
import 'package:learnify_client/screens/sign_up_screen/register_cubit.dart';

import '../profile_mentor_screen/profile_mentor_screen.dart';

class SettingContentScreen extends StatelessWidget {
  const SettingContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingContentCubit, SettingContentState>(
      builder: (context, state) {
        final cubit = context.read<SettingContentCubit>();
        return Scaffold(
          appBar: AppBar(
            title: !cubit.isSearching
                ? Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : TextField(
                    controller: cubit.searchController,
                    onChanged: cubit.filteredSearchResults,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: GestureDetector(
                  onTap: () {
                    cubit.searchButton();
                  },
                  child: Icon(
                    cubit.isSearching ? Icons.close : Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              _personInfo(context),
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

  Padding _settingBody(SettingContentModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 18),
      child: BlocBuilder<SettingContentCubit, SettingContentState>(
        builder: (context, state) {
          final cubit = context.read<SettingContentCubit>();
          return GestureDetector(
            onTap: () {
              if (model.name == 'Rate US') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RateDialog();
                  },
                );
              } else if (model.name == 'About US') {
                Get.to(AboutUs());
              } else if (model.name == 'Manage Notification') {
                Get.to(ManageNotification());
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
                      color: Color(0x19056AFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Icon(
                      model.icon,
                      color: Kcolor.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
                  if (model.name == "TalkBack")
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: model.isSwitched ?? false,
                        activeColor: Colors.blue,
                        trackColor: Colors.grey,
                        onChanged: (bool value) {
                          cubit.talkBackSwitch(model, value);
                        },
                      ),
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

  Padding _personInfo(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

    final loginCubit = context.read<LoginCubit>();
    var box = Hive.box('USER_BOX');
    String? username = box.get('username', defaultValue: loginCubit.username);
    String? email = box.get('email', defaultValue: registerCubit.emaill);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
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
                      image: AssetImage('assets/images/OIP.jfif'),
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
                        '${email ?? 'example@gmail.com'}',
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
                        '${username ?? 'guest'}',
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
      ),
    );
  }
}
