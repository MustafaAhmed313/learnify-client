import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/course_detail.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Featured Courses',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: width * 0.45,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (c, i) =>
                          buildcourses(height, cubit, width, featuredModel[i]),
                      separatorBuilder: (c, i) => SizedBox(
                        height: height * 0.02,
                      ),
                      itemCount: featuredModel.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector buildcourses(
      double height, SwitchCubit cubit, double width, FeaturedModel model) {
    return GestureDetector(
      onTap: () {
        if (model.title == 'Busseniss Managemant')
          Get.to(
            CourseDetail(
              course: FeaturedModel(
                  title: 'Busseniss Managemant',
                  description: "Supply Chain Managemant",
                  image: 'assets/images/R (1).jfif'),
            ),
          );
        else if (model.title == 'UI/UX Design')
          Get.to(
            CourseDetail(
              course: FeaturedModel(
                  title: 'UI/UX Design',
                  description: 'User Interface Design Essentials',
                  image: 'assets/images/R.jfif'),
            ),
          );
      },
      child: Container(
        height: height * 0.36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cubit.isDarkMode ? Colors.black : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.02, right: width * 0.02, left: width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(model.image??""),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Kcolor.mainColor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 3, bottom: 3),
                        child: Text(
                          model.title??'',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.description??'',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    )
                  ],
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
                    style: TextStyle(fontSize: 11),
                  ),
                  Spacer(),
                  Text(
                    '\$75',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
