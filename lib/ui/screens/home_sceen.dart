import 'package:app_briidea/functions/custom_function.dart';

import 'package:app_briidea/ui/mobile/mobile_chat_ui.dart';
import 'package:app_briidea/ui/screens/home_screen_web.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFunctions.isMobile(context) ? MobileChatUi() : HomeScreenWeb();
  }
}
