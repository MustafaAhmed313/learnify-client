import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../const/app_font_sizes.dart';
import '../../../const/app_font_weights.dart';


PreferredSizeWidget profileAppBar() {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: const Icon(
          Icons.arrow_back_rounded,
          size: 28
      ),
    ),
    title: const Text(
      'Profile Mentor',
      style: TextStyle(
          fontWeight: AppFontWeights.medium,
          fontSize: AppFontSizes.num20
      ),
    ) ,
  );
}
