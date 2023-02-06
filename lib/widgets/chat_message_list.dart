import 'package:app_briidea/constants.dart';
import 'package:app_briidea/models/message.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;
  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    bool isMe = message.senderNumber == '123456789';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding:
                  EdgeInsets.only(left: isMe ? 15 : 0, right: isMe ? 15 : 0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  message.text!,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
                constraints:
                    BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
                decoration: BoxDecoration(
                    color: isMe ? Colors.pink : Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
