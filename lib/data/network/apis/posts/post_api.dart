import 'dart:async';
import 'dart:convert';

import 'package:app_briidea/data/network/constants/endpoints.dart';
import 'package:app_briidea/data/network/dio_client.dart';
import 'package:app_briidea/data/network/rest_client.dart';
import 'package:app_briidea/models/groupchat_response/groupchat_response.dart';
import 'package:app_briidea/models/grouplist_response/grouplist_response.dart';
import 'package:app_briidea/models/usercaht_response/userchat_response.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<UserListResponse> getUserList() async {
    try {
      final res = await _dioClient.get(Endpoints.getUserList);
      return UserListResponse.fromJson(res);
      // Users.fromJson(jsonresponse[0]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Returns list of post in response
  Future<GroupListResponse> getGroupList() async {
    try {
      final res = await _dioClient.get(Endpoints.getGroupList);
      return GroupListResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


  /// Returns list of post in response
  Future<UserChatResponse> getUserChatList() async {
    try {
      final res = await _dioClient.get(Endpoints.getUserChatList);
      return UserChatResponse.fromJson(res);
      // Users.fromJson(jsonresponse[0]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Returns list of post in response
  Future<GroupChatResponse> getGroupChatList() async {
    try {
      final res = await _dioClient.get(Endpoints.getGroupChatList);
      return GroupChatResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

 
}
