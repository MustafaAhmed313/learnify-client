import 'package:flutter/material.dart';

import '../../../const/app_font_sizes.dart';
import '../../../const/app_font_weights.dart';
import '../../../const/kcolor.dart';



Widget measuredTitle({
  required String title,
  required int counter
}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$counter',
          style: const TextStyle(
            fontWeight: AppFontWeights.semiBold,
            fontSize: AppFontSizes.num14
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Kcolor.borderBlack,
            fontWeight: AppFontWeights.regular,
            fontSize: AppFontSizes.num14
          ),
        ),
      ],
    )
  );

}
