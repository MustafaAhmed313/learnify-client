import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final switchCubit = context.read<SwitchCubit>();

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
                          width: 1
                      ),
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
                                fontWeight: AppFontWeights.medium
                            ),
                          ),
                          const Text(
                            'Head Developers',
                            style: TextStyle(
                                color: Kcolor.borderBlack,
                                fontSize: AppFontSizes.num14,
                                fontWeight: AppFontWeights.regular
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                measuredTitle(title: 'Courses', counter: 5),
                                measuredTitle(title: 'Students', counter: 17),
                                measuredTitle(title: 'Reviews', counter: 5),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
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
                        image: AssetImage('assets/images/avatar.jpeg'),
                        fit: BoxFit.cover
                    ),
                  )
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 38,
              child: BlocBuilder<TabChangeCubit, TabChangeState>(builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tabButton(title: 'About', isActive: cubit.tabNumber == 0, onTap: () {cubit.setTabNumber(0);}),
                    tabButton(title: 'Courses', isActive: cubit.tabNumber == 1, onTap: () {cubit.setTabNumber(1);}),
                    tabButton(title: 'Reviews', isActive: cubit.tabNumber == 2, onTap: () {cubit.setTabNumber(2);}),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

