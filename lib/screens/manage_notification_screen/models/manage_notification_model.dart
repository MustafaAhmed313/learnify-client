import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageNotificationModel {
  String? name;
  IconData? icon;
  bool? isSwitched;

  ManageNotificationModel({this.icon, this.name, this.isSwitched});
}

List<ManageNotificationModel> manageNotificationModel = [
  ManageNotificationModel(
    name: 'General Notification',
    icon: Icons.notifications_outlined,
    isSwitched: true,
  ),
  ManageNotificationModel(
    name: 'Show personal photos of hotels',
    icon: Icons.collections_outlined,
    isSwitched: false,
  ),
  ManageNotificationModel(
    name: 'Allow Sound',
    icon: CupertinoIcons.volume_up,
    isSwitched: false,
  ),
  ManageNotificationModel(
    name: 'App Updates',
    icon: Icons.system_security_update,
    isSwitched: true,
  ),
  ManageNotificationModel(
    name: 'Vibrate',
    icon: Icons.vibration,
    isSwitched: false,
  ),
];
