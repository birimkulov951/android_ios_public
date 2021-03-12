import 'dart:async';

import 'package:android_ios/common/image_assets.dart';
import 'package:android_ios/common/sizes.dart';
import 'package:android_ios/core.dart';
import 'package:android_ios/ui/authorization_page.dart';
import 'package:android_ios/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPrefHelper prefHelper = SharedPrefHelper(preferences: null);


  _startSplashScreen() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    //Navigator.of(context).pushNamedAndRemoveUntil(AppConstants.HOME_PAGE);
    if (prefHelper.getAuthToken() == null) {
    Navigation.intentWithClearAllRoutes(context, MyHomePage.routeName);
    } else {
      Navigation.intentWithClearAllRoutes(context, AuthorizationPage.routeName);
   }

  }

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: Sizes.width(context) / 3,
                width: Sizes.width(context) / 3,
                child: Image.asset(
                  ImagesAssets.logoImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp30(context)),
                    child: Text(
                      'Hello',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
            ),


    );
  }
}
