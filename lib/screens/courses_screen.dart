import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/course_detail.dart';
import 'package:learnify_client/screens/courses/cubit/courses_cubit.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class CoursesScreen1 extends StatefulWidget {
  const CoursesScreen1({super.key});

  @override
  State<CoursesScreen1> createState() => _CoursesScreen1State();
}

class _CoursesScreen1State extends State<CoursesScreen1> {
  @override
  Widget build(BuildContext context) {
    // الحصول على قائمة الكورسات المفضلة من خلال Cubit
    final favoriteCourses = context.watch<CoursesCubit>().getCourses();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                'My Courses',
              ),
            ),
          ),
          body: favoriteCourses.isEmpty
              ? Center(
                  child: Text("No Courses added yet!"),
                )
              : ListView.separated(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 20),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final course = favoriteCourses[index];

                    return BlocBuilder<CoursesCubit, CoursesState>(
                      builder: (context, state) {
                        final favcubit = context.read<CoursesCubit>();
                        return GestureDetector(
                          onTap: () {
                            // if (course.title == 'Busseniss Managemant')
                            //   Get.to(
                            //     CourseDetail(
                            //       course: FeaturedModel(
                            //           title: 'Busseniss Managemant',
                            //           description: "Supply Chain Managemant",
                            //           image: 'assets/images/R (1).jfif'),
                            //     ),
                            //   );
                            // else if (course.title == 'UI/UX Design')
                            //   Get.to(
                            //     CourseDetail(
                            //       course: FeaturedModel(
                            //           title: 'UI/UX Design',
                            //           description:
                            //               'User Interface Design Essentials',
                            //           image: 'assets/images/R.jfif'),
                            //     ),
                            //   );
                          },
                          child: Dismissible(
                            key: ValueKey(favoriteCourses[index]),
                            direction: DismissDirection.endToStart,
                            background: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: height * 0.36,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onDismissed: (direction) {
                              favcubit.deleteCourses(course);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Course removed'),
                              ));
                            },
                            child: Container(
                              height: height * 0.39,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cubit.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.02,
                                  right: width * 0.05,
                                  left: width * 0.05,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.2,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(course.image!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Kcolor.mainColor,
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 3,
                                              ),
                                              child: Text(
                                                course
                                                    .title!, // عرض عنوان الكورس
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: width * 0.05),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              course
                                                  .description!, // عرض وصف الكورس
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.visible,
                                              softWrap: true,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * 0.007),
                                    Row(
                                      children: [
                                        Text(course.title == 'UI/UX Design'
                                            ? '8/12 Lessons'
                                            : '3/10 Lessons'),
                                        Spacer(),
                                        Text(course.title == 'UI/UX Design'
                                            ? '80%'
                                            : '30%')
                                      ],
                                    ),
                                    Spacer(),
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 10,
                                        ),
                                        trackHeight: 6,
                                        activeTrackColor: Kcolor.mainColor,
                                        inactiveTrackColor: Colors.grey[300],
                                        thumbColor: Kcolor.mainColor,
                                        overlayShape: RoundSliderOverlayShape(
                                          overlayRadius: 15,
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Slider(
                                          value: course.title ==
                                                  'Busseniss Managemant'
                                              ? 0.3
                                              : 0.6,
                                          min: 0.0,
                                          max: 1.0,
                                          onChanged: (newValue) {
                                            setState(() {
                                              // Update progress
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height * 0.02),
                  itemCount: favoriteCourses.length,
                ),
        );
      },
    );
  }
}
