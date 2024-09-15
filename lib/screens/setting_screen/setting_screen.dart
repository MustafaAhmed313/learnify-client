import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/help_center/help_center_screen.dart';
import 'package:learnify_client/screens/setting_content/setting_content_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/setting_screen/models/setting_models.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Container(
              width: 390,
              height: 54,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF92929D),
                    radius: 15.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          _personInfo(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (c, i) => _settingBody(settingModels[i]),
              separatorBuilder: (c, i) => Divider(
                indent: 25,
                endIndent: 25,
              ),
              itemCount: settingModels.length,
            ),
          )
        ],
      ),
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
                      color: Color(0xFF030303),
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
                        value: model.isSwitched ?? false,
                        activeColor: Colors.blue,
                        trackColor: Colors.grey,
                        onChanged: (bool value) {
                          cubit.changeSwitch(model, value);
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

  Container _personInfo() {
    return Container(
      width: 370,
      height: 74,
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
            padding: const EdgeInsets.all(20),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.ARKjkmC8CHiN18CdgXJ9ngHaHa?rs=1&pid=ImgDetMain"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
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
                        color: Color(0xFF030303),
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
