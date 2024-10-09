import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/course_detail.dart';
import 'package:learnify_client/screens/courses/courses_screen.dart';
import 'package:learnify_client/screens/home_screen/cubit/carousel_cubit.dart';
import 'package:learnify_client/screens/home_screen/models/ctegories_model.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                      height: height * 0.23,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: height * 0.19,
                            decoration: ShapeDecoration(
                              color: Color(0xFF056AFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(width * 0.02),
                                  bottomRight: Radius.circular(width * 0.02),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: width * 0.05,
                                left: width * 0.05,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: height * 0.07, left: width * 0.02),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Welcome 👋',
                                          style: TextStyle(
                                            color: Color(0xFFFCFCFC),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          'Let`s start learning',
                                          style: TextStyle(
                                            color: Color(0xFFFCFCFC),
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: width * 0.1,
                                    height: width * 0.1,
                                    padding: const EdgeInsets.all(8),
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFCFCFC),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: Kcolor.mainColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * 0.16,
                            left: width * 0.05,
                            right: width * 0.05,
                            child: BlocBuilder<SwitchCubit, SwitchState>(
                              builder: (context, state) {
                                final switchSearch =
                                    context.read<SwitchCubit>();
                                return Container(
                                  width: width * 0.9,
                                  height: height * 0.056,
                                  padding: const EdgeInsets.all(12),
                                  decoration: ShapeDecoration(
                                    color: switchSearch.isDarkMode
                                        ? Colors.black
                                        : Color(0xFFFCFCFC),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: ' Search something...',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF92929D),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                      ),
                                      prefixIconColor: Color(0xFF92929D),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * 0.014,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Explore Category',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFF056AFF),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true, // Add this property
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: width * 0.045,
                          mainAxisSpacing: height * 0.017,
                          childAspectRatio: 3,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildCategory(ctegoriesModel[index], context);
                        },
                      ),
                      // SizedBox(
                      //   height: height * 0.08,
                      //   child: ListView.separated(
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (c, i) =>
                      //           _buildCategories(ctegoriesModel[i], context),
                      //       separatorBuilder: (c, i) => SizedBox(
                      //             width: width * 0.025,
                      //           ),
                      //       itemCount: ctegoriesModel.length),
                      // ),
                      // SizedBox(
                      //   height: height * 0.017,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Best Offers',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: height * 0.017,
                      // ),
                      // CarouselSlider(
                      //   items: List.generate(
                      //     4,
                      //     (index) => Container(
                      //       height: height * 0.12,
                      //       width: double.infinity,
                      //       decoration: ShapeDecoration(
                      //         color:
                      //             Colors.black.withOpacity(0.20000000298023224),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4)),
                      //       ),
                      //     ),
                      //   ),
                      //   carouselController: cubit.carouselController,
                      //   options: CarouselOptions(
                      //       height: height * 0.1,
                      //       aspectRatio: 16 / 9,
                      //       viewportFraction: 1,
                      //       initialPage: 0,
                      //       enableInfiniteScroll: true,
                      //       reverse: false,
                      //       autoPlay: true,
                      //       autoPlayInterval: Duration(seconds: 3),
                      //       autoPlayAnimationDuration:
                      //           Duration(milliseconds: 800),
                      //       autoPlayCurve: Curves.fastOutSlowIn,
                      //       enlargeCenterPage: true,
                      //       enlargeFactor: 0.3,
                      //       scrollDirection: Axis.horizontal,
                      //       onPageChanged: (index, reason) {
                      //         cubit.onPageChange(index);
                      //       }),
                      // ),
                      // SizedBox(
                      //   height: height * 0.015,
                      // ),
                      // SmoothPageIndicator(
                      //   controller:
                      //       PageController(initialPage: cubit.currentIndex),
                      //   count: 4,
                      //   effect: WormEffect(
                      //     dotHeight: width * 0.023,
                      //     dotWidth: width * 0.023,
                      //     type: WormType.thinUnderground,
                      //   ),
                      //   onDotClicked: (index) {
                      //     cubit.carouselController.animateToPage(index);
                      //   },
                      // ),
                      // SizedBox(
                      //   height: height * 0.01,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Popular courses',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Text(
                      //       'See All',
                      //       style: TextStyle(
                      //         color: Color(0xFF056AFF),
                      //         fontSize: 12,
                      //         fontFamily: 'Poppins',
                      //         fontWeight: FontWeight.w500,
                      //         decoration: TextDecoration.underline,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: height * 0.016,
                      // ),
                      // Container(
                      //   height: height * 0.1,
                      //   width: double.infinity,
                      //   decoration: ShapeDecoration(
                      //     color: Colors.black.withOpacity(0.20000000298023224),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4)),
                      //   ),
                      // ),

                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Featured Courses',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(CoursesScreen());
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFF056AFF),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.37,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) => _buildFeaturedCourses(context),
                          separatorBuilder: (c, i) => SizedBox(
                            width: width * 0.05,
                          ),
                          itemCount: 3,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  Widget _buildFeaturedCourses(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final switchcubit = context.read<SwitchCubit>();
        return GestureDetector(
          onTap: () {
            Get.to(CourseDetail());
          },
          child: Container(
            width: width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: switchcubit.isDarkMode ? Colors.black : Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: height * 0.02, right: width * 0.04, left: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.18,
                    width: width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/R.jfif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.035,
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
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'User Interface Design Essentials',
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
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: height * 0.01,
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
      },
    );
  }

  Widget _buildCategory(CtegoriesModel model, BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final switchh = context.read<SwitchCubit>();
        return Container(
          decoration: BoxDecoration(
            color: switchh.isDarkMode ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height * 0.055,
                width: height * 0.055,
                decoration: BoxDecoration(
                    color: Kcolor.mainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  model.icon,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    model.courses!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // Expanded _buildCategories(CtegoriesModel model, BuildContext context) {
  //   final height = MediaQuery.of(context).size.height;
  //   final width = MediaQuery.of(context).size.width;

  //   return Expanded(
  //     child: Container(
  //       height: height * 0.1,
  //       padding: EdgeInsets.symmetric(
  //           horizontal: width * 0.03, vertical: height * 0.01),
  //       decoration: ShapeDecoration(
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(width: 1, color: Color(0xFF92929D)),
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           model.name == 'Business'
  //               ? Icon(
  //                   Icons.lightbulb_outline,
  //                   color: Colors.grey,
  //                 )
  //               : Image.asset(model.image!),
  //           Text(
  //             model.name!,
  //             style: TextStyle(
  //               color: Color(0xFF92929D),
  //               fontSize: 14,
  //               fontFamily: 'Poppins',
  //               fontWeight: FontWeight.w400,
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
