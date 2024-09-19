import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsModel {
  String? name;
  IconData? icon;
  String? image;
  AboutUsModel({this.icon, this.name, this.image});
}

List<AboutUsModel> aboutUsModel = [
  AboutUsModel(icon: Icons.system_security_update, name: 'App Updates'),
  AboutUsModel(icon: Icons.feedback_outlined, name: 'App Feedback'),
  AboutUsModel(icon: Icons.feed_outlined, name: 'Privacy Policy'),
  AboutUsModel(icon: Icons.comment_outlined, name: 'Social Media'),
  AboutUsModel(icon: Icons.article_outlined, name: 'Terms of use'),
];
