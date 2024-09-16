import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnify_client/const/kcolor.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Color(0xFF030303),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 50, left: 18, right: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      border: Border(
                        left: BorderSide(color: Color(0xFFACCDFF)),
                        top: BorderSide(width: 1, color: Color(0xFFACCDFF)),
                        right: BorderSide(color: Color(0xFFACCDFF)),
                        bottom: BorderSide(color: Color(0xFFACCDFF)),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Color(0xFF030303),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Omar Ashour',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFF92929D)))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Color(0xFF030303),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: '01122326612',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFF92929D)))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Color(0xFF030303),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'omarabdoulrahman@gmail.com ',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFF92929D)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 190),
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Updated Successfully !'),
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF056AFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                        color: Color(0xFFFCFCFC),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 52,
            left: 148,
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 41,
                        backgroundColor: Color(0xFFACCDFF),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFFACCDFF),
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://th.bing.com/th/id/OIP.ARKjkmC8CHiN18CdgXJ9ngHaHa?rs=1&pid=ImgDetMain',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 66,
                      left: 63,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Kcolor.mainColor,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Omar Ashour',
                  style: TextStyle(
                    color: Color(0xFF030303),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
