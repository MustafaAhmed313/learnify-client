import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/profile_mentor_screen/cubit/tab_change_cubit.dart';
import 'package:learnify_client/screens/profile_mentor_screen/widgets/profile_app_bar.dart';
import 'package:learnify_client/screens/profile_mentor_screen/widgets/measured_title.dart';
import 'package:learnify_client/screens/profile_mentor_screen/widgets/tab_button.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

import '../../const/app_font_sizes.dart';
import '../../const/app_font_weights.dart';

class ProfileMentorScreen extends StatelessWidget {
  const ProfileMentorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TabChangeCubit>();

    return Scaffold(
      appBar: profileAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Container(
                    width: double.infinity,
                    height: 162,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: Kcolor.borderBlack,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ahmed Hossam',
                              style: TextStyle(
                                  fontSize: AppFontSizes.num18,
                                  fontWeight: AppFontWeights.medium),
                            ),
                            const Text(
                              'Head Developers',
                              style: TextStyle(
                                  color: Kcolor.borderBlack,
                                  fontSize: AppFontSizes.num14,
                                  fontWeight: AppFontWeights.regular),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  measuredTitle(title: 'Courses', counter: 5),
                                  measuredTitle(title: 'Students', counter: 17),
                                  measuredTitle(title: 'Reviews', counter: 5),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 18.5),
                    height: 70,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/pngtree-man-avatar-image-for-profile-png-image_13001882.png'),
                          fit: BoxFit.cover),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 38,
              child: BlocBuilder<TabChangeCubit, TabChangeState>(
                  builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tabButton(
                        title: 'About',
                        isActive: cubit.tabNumber == 0,
                        onTap: () {
                          cubit.setTabNumber(0);
                        }),
                    tabButton(
                        title: 'Courses',
                        isActive: cubit.tabNumber == 1,
                        onTap: () {
                          cubit.setTabNumber(1);
                        }),
                    tabButton(
                        title: 'Reviews',
                        isActive: cubit.tabNumber == 2,
                        onTap: () {
                          cubit.setTabNumber(2);
                        }),
                  ],
                );
              }),
            ),
            BlocBuilder<TabChangeCubit, TabChangeState>(
              builder: (context, state) {
                if (cubit.tabNumber == 0) {
                  // About tab
                  return _buildAbout();
                } else if (cubit.tabNumber == 1) {
                  // Courses tab
                  return _buildCourses();
                } else if (cubit.tabNumber == 2) {
                  // Reviews tab
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 10, left: 10),
                    child: Column(
                      children: [_buildReveiw(), _buildReveiw()],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }

  Column _buildReveiw() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/pngtree-man-avatar-image-for-profile-png-image_13001882.png',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Peter mark',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Spacer(),
                      Text(
                        '04 Apr 2023',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color.fromARGB(255, 234, 228, 228),
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }

  Widget _buildCourses() {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (c, i) => Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cubit.isDarkMode ? Colors.black : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10, bottom: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/R.jfif'),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Kcolor.mainColor,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 7.0, left: 7),
                                          child: Text(
                                            'UI/UX Design',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20, bottom: 5, top: 5),
                                  child: Text(
                                    'User Interface Design Essential',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      ' 4.9 (80 Reviews)',
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$75',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (c, i) => SizedBox(
                    height: 10,
                  ),
                  itemCount: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _buildAbout() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text',
            softWrap: true,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color.fromARGB(255, 234, 228, 228),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'Social Media',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              _buildSocialMedia(FontAwesomeIcons.facebook),
              SizedBox(
                width: 10,
              ),
              _buildSocialMedia(FontAwesomeIcons.instagram),
              SizedBox(
                width: 10,
              ),
              _buildSocialMedia(FontAwesomeIcons.twitter),
              SizedBox(
                width: 10,
              ),
              _buildSocialMedia(FontAwesomeIcons.linkedin),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildSocialMedia(
    IconData? icon,
  ) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Icon(icon),
    );
  }
}
