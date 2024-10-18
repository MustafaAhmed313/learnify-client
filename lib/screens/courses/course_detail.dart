import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/courses/models/lessons_model.dart';
import 'package:learnify_client/screens/favourite/cubit/favourite_cubit.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:learnify_client/screens/payment/payment_screen.dart';
import 'package:learnify_client/screens/profile_mentor_screen/mentor_chating_screen.dart';
import 'package:learnify_client/screens/profile_mentor_screen/profile_mentor_screen.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class CourseDetail extends StatefulWidget {
  final FeaturedModel course;
  const CourseDetail({super.key, required this.course});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool isExpanded = false;
  final String text =
      'Product Designers are responsible for coming up with new product designs that meet the needs and wants of consumers. They will have many duties, such as creating design concepts, drawing ideas to determine Product Designers are responsible for coming up with new product designs that meet the needs and wants of consumers. They will have many duties, such as creating design concepts, drawing ideas to determine ';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final course = widget.course;
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
                      image: AssetImage(course.image!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.04,
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
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8, top: 10),
                          child: GestureDetector(
                              onTap: () {
                                context
                                    .read<FavouriteCubit>()
                                    .addToFavorites(course);
                                Get.snackbar('Added',
                                    '${course.title} added to favorites',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              },
                              child: Icon(Icons.book_outlined)),
                        )
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Kcolor.mainColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 8, left: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      course.title!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
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
                        course.description!,
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(ProfileMentorScreen());
                            },
                            child: CircleAvatar(
                              radius: width * 0.078,
                              child: Image.asset(
                                'assets/images/pngtree-man-avatar-image-for-profile-png-image_13001882.png',
                                fit: BoxFit.fill,
                              ),
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
                          GestureDetector(
                            onTap: () {
                              Get.to(MentorChatingScreen());
                            },
                            child: Container(
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
                            ),
                          )
                        ],
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
                          if (course.title == 'Busseniss Managemant')
                            Get.to(
                              PaymentScreen(
                                course: FeaturedModel(
                                    title: 'Busseniss Managemant',
                                    description: "Supply Chain Managemant",
                                    image: 'assets/images/R (1).jfif'),
                              ),
                            );
                          else if (course.title == 'UI/UX Design')
                            Get.to(
                              PaymentScreen(
                                course: FeaturedModel(
                                    title: 'UI/UX Design',
                                    description:
                                        'User Interface Design Essentials',
                                    image: 'assets/images/R.jfif'),
                              ),
                            );
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
