import 'package:flutter/cupertino.dart';

import '../../../const/app_font_sizes.dart';
import '../../../const/app_font_weights.dart';
import '../../../const/kcolor.dart';

Widget tabButton({
  required String title,
  required bool isActive,
  void Function()? onTap
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Kcolor.blue : Kcolor.borderBlack,
              width: 2,
              style: BorderStyle.solid
            )
          )
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Kcolor.blue : Kcolor.borderBlack,
              fontWeight: AppFontWeights.medium,
              fontSize: AppFontSizes.num16
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    )
  );
}
