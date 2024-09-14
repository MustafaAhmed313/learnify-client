import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingContentModel {
  String? name;
  IconData? icon;
  String? optionalName;
  bool? isSwitched;

  SettingContentModel(
      {this.name, this.icon, this.optionalName, this.isSwitched});
}

List<SettingContentModel> settingContentModel = [
  SettingContentModel(
    name: 'My Card',
    icon: Icons.credit_card_outlined,
  ),
  SettingContentModel(
    name: 'Change Password',
    icon: Icons.key_outlined,
  ),
  SettingContentModel(
    name: 'Manage Notification',
    icon: Icons.notifications_outlined,
  ),
  SettingContentModel(
      name: 'TalkBack',
      icon: CupertinoIcons.volume_up,
      optionalName: 'Effective',
      isSwitched: false),
  SettingContentModel(
    name: 'About US',
    icon: Icons.info_outline,
  ),
  SettingContentModel(
    name: 'Rate US',
    icon: Icons.rate_review_outlined,
  ),
  SettingContentModel(
    name: 'Country',
    icon: Icons.language,
  ),
  SettingContentModel(
    name: 'Contact US',
    icon: Icons.people_rounded,
  ),
];
