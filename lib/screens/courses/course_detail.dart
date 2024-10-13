import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/models/lessons_model.dart';
import 'package:learnify_client/screens/payment/payment_screen.dart';
import 'package:learnify_client/screens/profile_mentor_screen/profile_mentor_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool isExpanded = false;
  final String text =
      'uhoiuh ijoij oijoijoj ijoihjoi ohoihoih hoiqhohw qhdowuhdoq uhqoiuhwdo oihqoihdoq odhqohdoq ohdqoihodhq idhqoiwdoqh udhqouhwdoq oudhqouhdwoqhdo ohdoquhdwoqhwd ohdoqhdohwqod qudoqhdoquhdo qudoqhdoqihd ';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.37,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/R.jfif"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.03,
                      left: width * 0.04,
                      right: width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      left: width * 0.04,
                      right: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: height * 0.03,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Kcolor.mainColor,
                            ),
                            child: Center(
                              child: Text(
                                'UI/UX Design',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$75',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        'User Interface Design Essentials',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: height * 0.007,
                          ),
                          Text(
                            '4.9 (80 Reviews)',
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Icon(Icons.timer_outlined),
                          Text(
                            '5 hours 30 mins',
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ProfileMentorScreen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: width * 0.078,
                              child: Image.asset(
                                'assets/images/pngtree-man-avatar-image-for-profile-png-image_13001882.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Johnson mate',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Lead designer')
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: height * 0.063,
                              width: height * 0.063,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Kcolor.mainColor,
                              ),
                              child: Icon(
                                Icons.message_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.013,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: isExpanded
                                    ? text
                                    : text.substring(0, 140) + '...',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: cubit.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      child: Text(
                                        isExpanded
                                            ? ' Read Less'
                                            : ' Read More',
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Lessons',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (c, i) => _buildLessons(lessonModel[i]),
                        separatorBuilder: (c, i) => Divider(),
                        itemCount: lessonModel.length,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(PaymentScreen());
                        },
                        child: Container(
                          height: height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Kcolor.mainColor,
                          ),
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _buildLessons(LessonsModel model) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.012, top: height * 0.012),
      child: Row(
        children: [
          Container(
            height: height * 0.06,
            width: height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue.withOpacity(0.4),
            ),
            child: Icon(
              Icons.play_arrow_outlined,
              color: Kcolor.mainColor,
              size: width * 0.077,
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(model.mins!)
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
