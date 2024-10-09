import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/setting_screen/cubit/switch_cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedCard = '';
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
                Container(
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
