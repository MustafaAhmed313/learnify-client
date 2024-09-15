import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/setting_content/cubit/setting_content_cubit.dart';
import 'package:learnify_client/screens/setting_content/models/setting_content_model.dart';

class SettingContentScreen extends StatelessWidget {
  const SettingContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(
            color: Color(0xFF030303),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _personInfo(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (c, i) => _settingBody(settingContentModel[i]),
              separatorBuilder: (c, i) => Divider(
                indent: 25,
                endIndent: 25,
              ),
              itemCount: settingContentModel.length,
            ),
          )
        ],
      ),
    );
  }

  Padding _settingBody(SettingContentModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 18),
      child: BlocBuilder<SettingContentCubit, SettingContentState>(
        builder: (context, state) {
          final cubit = context.read<SettingContentCubit>();
          return Container(
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
          );
        },
      ),
    );
  }

  Padding _personInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
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
      ),
    );
  }
}
