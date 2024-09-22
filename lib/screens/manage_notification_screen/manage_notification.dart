import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/manage_notification_screen/models/manage_notification_model.dart';

class ManageNotification extends StatefulWidget {
  const ManageNotification({super.key});

  @override
  State<ManageNotification> createState() => _ManageNotificationState();
}

class _ManageNotificationState extends State<ManageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Notification',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (c, i) => _manageContent(manageNotificationModel[i]),
              separatorBuilder: (c, i) => Divider(
                indent: 25,
                endIndent: 25,
              ),
              itemCount: manageNotificationModel.length,
            ),
          )
        ],
      ),
    );
  }

  Padding _manageContent(ManageNotificationModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 18),
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
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: model.isSwitched ?? false,
                activeColor: Colors.blue,
                trackColor: Colors.grey,
                onChanged: (bool value) {
                  model.isSwitched = value;
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
