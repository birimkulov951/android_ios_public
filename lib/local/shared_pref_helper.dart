import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//@LazySingleton()
class SharedPrefHelper {


  final SharedPreferences preferences;
  SharedPrefHelper({@required this.preferences});


  static const _AUTH_TOKEN = "auth_token";
  static const _THEME = "theme";

  //set data into shared preferences like this
  Future<void> setAuthToken(String authToken) async {
    preferences.setString(_AUTH_TOKEN, authToken);
  }

  //get value from shared preferences
  Future<String> getAuthToken() async {
    String authToken;
    authToken = preferences.getString(_AUTH_TOKEN) ?? "null";
    return authToken;
  }

  Future saveValueDarkTheme(bool value) async {
    preferences.setBool(_THEME, value);
  }

  Future<bool> getValueDarkTheme() async {
    return preferences.getBool(_THEME) ?? false;
  }
}