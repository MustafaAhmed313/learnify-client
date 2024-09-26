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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        final cubit = context.read<HelpCenterCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Help Center',
              style: TextStyle(
                fontSize: width * 0.05,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.075),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.075),
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
                              fontSize: width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: 2,
                            width: width * 0.45,
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
                              fontSize: width * 0.04,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            height: 2,
                            width: width * 0.4,
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
                      padding: EdgeInsets.only(
                          top: height * 0.025, left: width * 0.05),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.05,
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
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
                                  fontSize: width * 0.04,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Container(
                            width: width * 0.25,
                            height: height * 0.05,
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
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
                                  fontSize: width * 0.04,
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
                      padding: EdgeInsets.all(width * 0.05),
                      child: Expanded(
                        child: Container(
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.06,
                                width: width * 0.75,
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
                                width: height * 0.06,
                                height: height * 0.06,
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
                    height: height * 0.025,
                  ),
                  _contactContent(
                      Icons.headphones_outlined, 'Customer Service'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  _contactContent(FontAwesomeIcons.whatsapp, 'WhatsApp'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  _contactContent(Icons.language, 'Website'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  _contactContent(FontAwesomeIcons.facebook, 'Facebook'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  _contactContent(FontAwesomeIcons.instagram, 'Instagram'),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  _contactContent(FontAwesomeIcons.twitter, 'Twitter'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _faq() {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        width: width * 0.95,
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
                fontSize: width * 0.04,
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: width * 0.035,
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      height: height * 0.06,
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
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
