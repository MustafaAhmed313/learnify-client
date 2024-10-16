import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MentorChatingScreen extends StatefulWidget {
  const MentorChatingScreen({super.key});

  @override
  _MentorChatingScreenState createState() => _MentorChatingScreenState();
}

class _MentorChatingScreenState extends State<MentorChatingScreen> {
  // تعديل نوع القائمة ليحتوي على خريطة تمثل الرسالة والوقت
  List<Map<String, String>> messages = [];
  TextEditingController messageController = TextEditingController();
  List<String> autoReplies = [
    "Hello! How can I help?",
    "I’m here for you.",
    "That sounds great!",
    "Can you explain more?",
    "I’ll get back to you shortly."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: [
              _buildPhoto(),
              SizedBox(width: 7),
              _buildName(),
              Spacer(),
              Icon(Icons.call),
              SizedBox(width: 15),
              Icon(Icons.menu),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(
                  messages[index]['message']!,
                  messages[index]['time']!,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Type something...',
                          hintStyle: TextStyle(
                            color: Color(0xFF92929D),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(CupertinoIcons.camera),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        String currentTime = _getCurrentTime();
        messages.insert(0, {
          'message': messageController.text,
          'time': currentTime,
        });
        messageController.clear();
      });

      Future.delayed(Duration(seconds: 3), _autoReply);
    }
  }

  void _autoReply() {
    setState(() {
      String replyMessage = autoReplies[messages.length % autoReplies.length];
      String currentTime = _getCurrentTime();
      messages.insert(0, {
        'message': replyMessage,
        'time': currentTime,
      });
    });
  }

  String _getCurrentTime() {
    return DateTime.now().toLocal().toString().substring(11, 16);
  }

  Widget _buildMessageBubble(String message, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Align(
        alignment: autoReplies.contains(message)
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: autoReplies.contains(message)
                ? Colors.grey.shade200
                : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: autoReplies.contains(message)
                  ? Radius.zero
                  : Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: autoReplies.contains(message)
                  ? Radius.circular(10)
                  : Radius.zero,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: autoReplies.contains(message)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                time,
                style: TextStyle(
                  fontSize: 10,
                  color: autoReplies.contains(message)
                      ? Colors.grey
                      : Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CircleAvatar _buildPhoto() {
    return CircleAvatar(
      backgroundImage: AssetImage(
          'assets/images/pngtree-man-avatar-image-for-profile-png-image_13001882.png'),
    );
  }

  Text _buildName() {
    return Text(
      'Johnson mate',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
