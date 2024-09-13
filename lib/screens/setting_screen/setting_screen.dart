import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
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
                indent: 20,
                endIndent: 20,
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
      padding: const EdgeInsets.only(left: 20, right: 20),
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
            if (model.optionalName != null && model.optionalName!.isNotEmpty)
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
              CupertinoSwitch(
                value: model.isSwitched ?? false,
                activeColor: Colors.blue,
                trackColor: Colors.grey,
                onChanged: (bool value) {
                  model.isSwitched = value;
                },
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
  }

  Container _personInfo() {
    return Container(
      width: 354,
      height: 74,
      padding: const EdgeInsets.all(12),
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
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(20),
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
