import 'package:flutter/material.dart';

class SettingModels {
  String? name;
  IconData? icon;
  String? optionalName;
  bool? isSwitched;

  SettingModels({this.icon, this.name, this.optionalName, this.isSwitched});
}

List<SettingModels> settingModels = [
  SettingModels(
    name: "Edit Profile",
    icon: Icons.person,
  ),
  SettingModels(
    name: "Setting",
    icon: Icons.settings,
  ),
  // SettingModels(
  //   name: "Manage Notification",
  //   icon: Icons.notifications_none,
  // ),
  SettingModels(
    name: "Help Center",
    icon: Icons.help_center_outlined,
  ),
  SettingModels(
    name: "Dark Mode",
    icon: Icons.dark_mode_outlined,
    optionalName: "Not effective",
    isSwitched: false,
  ),
  SettingModels(
      name: "Language", icon: Icons.language, optionalName: "English (UK)"),
  SettingModels(
    name: "Change password",
    icon: Icons.key_outlined,
  ),
  SettingModels(
    name: "Logout",
    icon: Icons.logout,
  ),
];
