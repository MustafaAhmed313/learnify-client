import 'package:flutter/material.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/about_us_screen/models/about_us_model.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (c, i) => _content(aboutUsModel[i]),
                separatorBuilder: (c, i) => Divider(
                      indent: 25,
                      endIndent: 25,
                    ),
                itemCount: aboutUsModel.length),
          )
        ],
      ),
    );
  }

  Padding _content(AboutUsModel model) {
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
            Icon(
              Icons.arrow_forward_ios,
              color: Kcolor.mainColor,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
