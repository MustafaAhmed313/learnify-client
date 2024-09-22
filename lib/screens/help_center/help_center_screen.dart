import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/help_center/cubit/help_center_cubit.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        final cubit = context.read<HelpCenterCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Help Center',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.animatedToTab(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'FAQ',
                            style: TextStyle(
                              color: cubit.tabController.index == 0
                                  ? Kcolor.mainColor
                                  : Color(0xFF92929D),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 170,
                            color: cubit.tabController.index == 0
                                ? Kcolor.mainColor
                                : Color(0xFF92929D),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.animatedToTab(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Contact us',
                            style: TextStyle(
                              color: cubit.tabController.index == 1
                                  ? Kcolor.mainColor
                                  : Color(0xFF92929D),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 2,
                            width: 179,
                            color: cubit.tabController.index == 1
                                ? Kcolor.mainColor
                                : Color(0xFF92929D),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: cubit.tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 96,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Color(0xFF056AFF),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF056AFF)),
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'General',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 96,
                            height: 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF056AFF)),
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Service',
                                style: TextStyle(
                                  color: Color(0xFF056AFF),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            height: 48,
                            width: 323,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Color(0xFF056AFF),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Icon(
                              Icons.mic_none_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        _faq(),
                        _faq(),
                        _faq(),
                        _faq(),
                        _faq(),
                      ],
                    )
                  ],
                ),
              ),

              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  _contactContent(
                      Icons.headphones_outlined, 'Customer Service'),
                  SizedBox(
                    height: 25,
                  ),
                  _contactContent(FontAwesomeIcons.whatsapp, 'WhatsApp'),
                  SizedBox(
                    height: 25,
                  ),
                  _contactContent(Icons.language, 'Website'),
                  SizedBox(
                    height: 25,
                  ),
                  _contactContent(FontAwesomeIcons.facebook, 'Facebook'),
                  SizedBox(
                    height: 25,
                  ),
                  _contactContent(FontAwesomeIcons.instagram, 'Instagram'),
                  SizedBox(
                    height: 25,
                  ),
                  _contactContent(FontAwesomeIcons.twitter, 'Twitter'),
                ],
              ), // Replace with Contact Us content
            ],
          ),
        );
      },
    );
  }

  Widget _faq() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 375,
        decoration: BoxDecoration(
          color: Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF92929D),
            width: 1,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(
              'What is Learnify?',
              style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            children: <Widget>[
              Divider(
                indent: 20,
                endIndent: 20,
                color: Color(0xFF92929D),
                thickness: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
            trailing: Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Kcolor.mainColor,
            ),
            iconColor: Kcolor.mainColor,
            collapsedIconColor: Kcolor.mainColor,
          ),
        ),
      ),
    );
  }

  Widget _contactContent(IconData? icon, String text) {
    return Container(
      width: 354,
      height: 48,
      decoration: ShapeDecoration(
        color: Color(0xFFFCFCFC),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF92929D)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF030303),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
