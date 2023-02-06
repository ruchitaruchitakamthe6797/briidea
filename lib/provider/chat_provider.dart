import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _chat=0 ;
  int get currentChatIndex => _currentIndex;
int get chat => _chat;
  void updateChatIndex(int index, data) {
    _currentIndex = index;
    _chat = data;
    notifyListeners();
  }
}
