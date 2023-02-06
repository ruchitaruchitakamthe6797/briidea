import 'dart:async';

import 'package:app_briidea/data/local/datasources/post/post_datasource.dart';
import 'package:app_briidea/data/sharedpref/shared_preference_helper.dart';
import 'package:app_briidea/models/groupchat_response/groupchat_response.dart';
import 'package:app_briidea/models/grouplist_response/grouplist_response.dart';
import 'package:app_briidea/models/post/post.dart';
import 'package:app_briidea/models/usercaht_response/userchat_response.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._postApi, this._sharedPrefsHelper, this._postDataSource);

  // Post: ---------------------------------------------------------------------
  // Future<UserListResponse> getUserList() async {
  //   // check to see if posts are present in database, then fetch from database
  //   // else make a network call to get all posts, store them into database for
  //   // later use
  //   return await _postApi.getUserList().then((postsList) {
  //     postsList.data?.forEach((post) {
  //       _postDataSource.insert(post);
  //     });

  //     return postsList;
  //   }).catchError((error) => throw error);
  // }

  // Post: ---------------------------------------------------------------------

  Future<UserListResponse> getUserList() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getUserList().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }

  // Post: ---------------------------------------------------------------------

  Future<GroupListResponse> getGroupList() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getGroupList().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }


  // Post: ---------------------------------------------------------------------

  Future<UserChatResponse> getUserChatList() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getUserChatList().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }

  // Post: ---------------------------------------------------------------------

  Future<GroupChatResponse> getGroupChatList() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getGroupChatList().then((postsList) {
      return postsList;
    }).catchError((error) => throw error);
  }


  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return await Future.delayed(Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  Future<void> changeNotificationSetting(bool value) =>
      _sharedPrefsHelper.changeNotificationSetting(value);

  bool get isPushNotification => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;

  bool? get isAccept => _sharedPrefsHelper.isAccept;

  Future<void> changeIsAccept(bool isAccept) =>
      _sharedPrefsHelper.setAccept(isAccept);

  // CurrentRole: -----------------------------------------------------------------
  String? get currentRole => _sharedPrefsHelper.currentRole;

  Future<void> setCurrentRole(String currentRole) =>
      _sharedPrefsHelper.setCurrentRole(currentRole);

  List<String>? get roles => _sharedPrefsHelper.roles;

  Future<void> setRoles(List<String> roles) =>
      _sharedPrefsHelper.setRoles(roles);

  // Location: -----------------------------------------------------------------
  Future<void> changeLocation(double latitude, double longitude, String city) =>
      _sharedPrefsHelper.changeLocation(latitude, longitude, city);

  double? get currentLatitude => _sharedPrefsHelper.currentLatitude;
  double? get currentLongitude => _sharedPrefsHelper.currentLongitude;
  String? get currentLocation => _sharedPrefsHelper.currentLocation;

  // StoreList: -----------------------------------------------------------------
  bool? get isStoreList => _sharedPrefsHelper.isStoreList;

  Future<void> setIsStoreList(bool isStoreList) =>
      _sharedPrefsHelper.setIsStoreList(isStoreList);
}
