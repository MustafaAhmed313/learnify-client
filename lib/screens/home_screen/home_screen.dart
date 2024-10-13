import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/course_detail.dart';
import 'package:learnify_client/screens/courses/courses_screen.dart';
import 'package:learnify_client/screens/home_screen/cubit/carousel_cubit.dart';
import 'package:learnify_client/screens/home_screen/models/ctegories_model.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';
import 'package:learnify_client/screens/sign_up_screen/register_cubit.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<FeaturedModel> featured = [];
  List<FeaturedModel> allFeatured = featuredModel;

  @override
  void initState() {
    // TODO: implement initState
    featured = allFeatured;
    searchController.addListener(() {
      filteredSearchResults(searchController.text);
    });

    super.initState();
  }

  void filteredSearchResults(String query) {
    List<FeaturedModel> tempList = [];
    if (query.isNotEmpty) {
      tempList = allFeatured
          .where((item) =>
              item.description!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      tempList = allFeatured;
    }

    setState(() {
      featured = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final loginCubit = context.read<RegisterCubit>();
    var box = Hive.box('USER_BOX');
    String? username = box.get('username', defaultValue: loginCubit.user);

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
                                          'Welcome ${username ?? ""}👋',
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
                                    controller: searchController,
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
                        height: height * 0.38,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (c, i) =>
                              _buildFeaturedCourses(context, featured[i]),
                          separatorBuilder: (c, i) => SizedBox(
                            width: width * 0.05,
                          ),
                          itemCount: featured.length,
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

  Widget _buildFeaturedCourses(BuildContext context, FeaturedModel model) {
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: height * 0.035,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Kcolor.mainColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 10),
                            child: Text(
                              model.title!,
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
                            model.description!,
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
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.018),
                    child: Row(
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
                    ),
                  ),
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
}
