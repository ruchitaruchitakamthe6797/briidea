import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.auth_token, authToken);
  }

  Future<String?> get userToken async {
    return _sharedPreference.getString(Preferences.user_token)??'';
  }

  Future<bool> saveUserToken(String authToken) async {
    return _sharedPreference.setString(Preferences.user_token, authToken);
  }

  Future<String?> get refreshToken async {
    return _sharedPreference.getString(Preferences.refresh_token);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    return _sharedPreference.setString(Preferences.refresh_token, refreshToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.auth_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  // Notification:---------------------------------------------------
  bool get isPushNotification {
    return _sharedPreference.getBool(Preferences.is_push_notification) ?? true;
  }
  Future<void> changeNotificationSetting(bool value) {
    return _sharedPreference.setBool(Preferences.is_push_notification, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }

  // Location:---------------------------------------------------
  double? get currentLatitude {
    return _sharedPreference.getDouble(Preferences.latitude);
  }

  double? get currentLongitude {
    return _sharedPreference.getDouble(Preferences.longitude);
  }
  String? get currentLocation {
    return _sharedPreference.getString(Preferences.city);
  }

  Future<void> changeLocation(double latitude,double longitude,String city) {
     _sharedPreference.setString(Preferences.city, city);
     _sharedPreference.setDouble(Preferences.latitude, latitude);
    return _sharedPreference.setDouble(Preferences.longitude, longitude);
  }

  // User Business:---------------------------------------------------
  String? get userBusiness {
    // Map<String, dynamic> map = jsonDecode(_sharedPreference.getString(Preferences.user_business)??'');
    // return UserBusiness.fromJson(map);
    return _sharedPreference.getString(Preferences.user_business) ?? '';

  }



  // Accept:---------------------------------------------------
  bool? get isAccept {
    return _sharedPreference.getBool(Preferences.is_accept);
  }

  Future<void> setAccept(bool isAccept) {
    return _sharedPreference.setBool(Preferences.is_accept, isAccept);
  }

  // Current role:---------------------------------------------------
  String? get currentRole {
    return _sharedPreference.getString(Preferences.current_role);
  }

  Future<void> setCurrentRole(String currentRole) {
    return _sharedPreference.setString(Preferences.current_role, currentRole);
  }

  List<String>? get roles {
    return _sharedPreference.getStringList(Preferences.roles);
  }

  Future<void> setRoles(List<String> roles) {
    return _sharedPreference.setStringList(Preferences.roles, roles);
  }

  bool? get isStoreList {
    return _sharedPreference.getBool(Preferences.isStoreList);
  }

  Future<void> setIsStoreList(bool isStoreList) {
    return _sharedPreference.setBool(Preferences.isStoreList, isStoreList);
  }
}