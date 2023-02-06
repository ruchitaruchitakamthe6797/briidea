import 'package:app_briidea/ui/chat_page/chat.dart';
import 'package:app_briidea/ui/group_chat/group_chat_details.dart';
import 'package:app_briidea/ui/user_chat/user_chat_list.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String chat = '/chat';
  static const String login = '/login';
  static const String user_chat = '/user_chat';
  static const String group_chat = '/group_chat';
  static final routes = <String, WidgetBuilder>{
    chat: (BuildContext context) => ChatPage(),
    user_chat: (BuildContext context) => ChatDetails(),
    group_chat: (BuildContext context) => GroupChatDetails(),
  };
}
