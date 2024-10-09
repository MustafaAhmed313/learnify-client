import 'package:flutter/material.dart';

class CtegoriesModel {
  String? name;
  String? courses;
  IconData? icon;

  CtegoriesModel({this.name, this.courses,this.icon});
}

List<CtegoriesModel> ctegoriesModel = [
  CtegoriesModel(
    name: 'Design',
    courses: '15 Courses',
    icon: Icons.design_services_outlined,
  ),
    CtegoriesModel(
    name: 'Business',
    courses: '25 Courses',
    icon: Icons.business_outlined,
  ),
      CtegoriesModel(
    name: 'IT & Tech',
    courses: '40 Courses',
    icon: Icons.code_sharp,
  ),
        CtegoriesModel(
    name: 'Market',
    courses: '10 Courses',
    icon: Icons.bar_chart_outlined,
  ),
];

