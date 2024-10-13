import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/bottomNav/bottom_nav.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedCard = 'Master Card';
  int itemTotal = 75;
  int discount = 2;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Checkout',
              style: TextStyle(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                left: width * 0.04, right: width * 0.04, top: height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cubit.isDarkMode ? Colors.black : Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                        top: height * 0.01,
                        bottom: height * 0.01),
                    child: Row(
                      children: [
                        Container(
                          height: height * 0.12,
                          width: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/R.jfif'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Kcolor.mainColor,
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.02,
                                            right: width * 0.02,
                                            top: height * 0.003,
                                            bottom: height * 0.003),
                                        child: Text(
                                          'UI/UX Design',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.1),
                                child: Text(
                                  'User Interface Design Essentials',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.004,
                              ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.026,
                ),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: height * 0.028,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCard = 'Master Card';
                    });
                  },
                  child: _buildCard(
                    image: 'assets/images/masterCard-removebg-preview.png',
                    name: 'Master Card',
                    number: '1234 1342 5653 2456',
                    isSelected: _selectedCard == 'Master Card',
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: _buildBottomDialogSheet(height, width),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.077,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Kcolor.mainColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.plus_circled,
                          color: Kcolor.mainColor,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          'Add New Card',
                          style: TextStyle(
                            color: Kcolor.mainColor,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCard = 'Paypal';
                    });
                  },
                  child: _buildCard(
                    image:
                        'assets/images/PayPal_Monogram_Full_Color_RGB_white-removebg-preview.png',
                    name: 'Paypal',
                    number: '',
                    isSelected: _selectedCard == 'Paypal',
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  children: [
                    Text('Item Total'),
                    Spacer(),
                    Text('\$$itemTotal')
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  children: [Text('Discount'), Spacer(), Text('\$$discount')],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  children: [
                    Text(
                      'Grand Total',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      '\$${itemTotal - discount}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    height: height * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Kcolor.mainColor,
                    ),
                    child: Center(
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomDialogSheet(double height, double width) {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Container(
            height: height * 0.52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cubit.isDarkMode ? Kcolor.black : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.016,
                  ),
                  Text(
                    'Add New Card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    'Add your card details here',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Container(
                    height: height * 0.077,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Kcolor.mainColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: TextField(
                        // decoration: InputDecoration(
                        //   enabledBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(
                        //         color: Kcolor
                        //             .mainColor), // Color when not focused
                        //     borderRadius:
                        //         BorderRadius.circular(10),
                        //   ),
                        // ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Card Number',
                          labelStyle: TextStyle(
                            color: Kcolor.mainColor,
                            fontSize: 14,
                          ),
                          hintText: '1234 5678 9012 1234',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Container(
                    height: height * 0.077,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Kcolor.mainColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Card Holder Name',
                          labelStyle: TextStyle(
                            color: Kcolor.mainColor,
                            fontSize: 14,
                          ),
                          hintText: 'Omar Ashour',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.077,
                        width: width * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Kcolor.mainColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Expiry Date',
                              labelStyle: TextStyle(
                                color: Kcolor.mainColor,
                                fontSize: 14,
                              ),
                              hintText: '12/2026',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.077,
                        width: width * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Kcolor.mainColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'CVV',
                              labelStyle: TextStyle(
                                color: Kcolor.mainColor,
                                fontSize: 14,
                              ),
                              hintText: '...',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        // Show the success bottom sheet after the current one is closed
                        Future.delayed(Duration(milliseconds: 200), () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child:
                                    _buildSuccessfullyDialoge(height, cubit)),
                          );
                        });
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
                            'Add Card',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  Container _buildSuccessfullyDialoge(double height, SwitchCubit cubit) {
    return Container(
      height: height * 0.47,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cubit.isDarkMode ? Kcolor.black : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset('assets/images/tick_1-removebg-preview.png'),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Payment Received',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Successfully',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              'Congratulations 🎉',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              'Enjoy your class!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: () {
                  Get.offAll(BottomNav());
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
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {String? image,
      String? name,
      required String number,
      required bool isSelected}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final cubit = context.read<SwitchCubit>();
        return Row(
          children: [
            Container(
              height: height * 0.06,
              width: height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cubit.isDarkMode
                    ? Colors.black.withOpacity(0.2)
                    : Kcolor.grey,
              ),
              child: Image.asset(image!),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                if (number.isNotEmpty)
                  Text(
                    number,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
              ],
            ),
            Spacer(),
            if (isSelected)
              CircleAvatar(
                radius: height * 0.012,
                backgroundColor: Kcolor.mainColor,
                child: CircleAvatar(
                  radius: height * 0.01,
                  backgroundColor:
                      cubit.isDarkMode ? Kcolor.black : Colors.white,
                  child: CircleAvatar(
                    radius: height * 0.0077,
                    backgroundColor: Kcolor.mainColor,
                  ),
                ),
              )
            else
              CircleAvatar(
                radius: height * 0.012,
                backgroundColor: Colors.grey.withOpacity(0.6),
                child: CircleAvatar(
                  radius: height * 0.01,
                  backgroundColor:
                      cubit.isDarkMode ? Kcolor.black : Colors.white,
                ),
              )
          ],
        );
      },
    );
  }
}
