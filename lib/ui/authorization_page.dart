import 'package:android_ios/bloc/authorization/authorization_bloc.dart';
import 'package:android_ios/common/styles/color_palettes.dart';
import 'package:android_ios/utils/app_localizations.dart';
import 'package:android_ios/utils/navigation.dart';
import 'package:android_ios/widgets/button/custom_button.dart';
import 'package:android_ios/widgets/text/custom_text.dart';
import 'package:android_ios/widgets/text/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_ios/core.dart';


import 'home_page.dart';

class AuthorizationPage extends StatefulWidget {
  static const routeName = "/authorizationPage";

  const AuthorizationPage({Key key}) : super(key: key);

  _AuthorizationPage createState() => _AuthorizationPage();
}

class _AuthorizationPage extends State<AuthorizationPage> {

  String _email;
  String _password;
  bool isProgressbar = false;

  bool _isCheckboxChecked = false;

  bool _isAlertMessageVisible = false;



  // Test
  _authorize(BuildContext context) {
    context.read<AuthorizationBloc>().add(LoadAuthorization(2,false));
  }



  void _alertMessage() {
    setState(() {
      _isAlertMessageVisible = !_isAlertMessageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    isProgressbar = false;

    return WillPopScope(
        onWillPop: () async => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child: Scaffold(
            body: Padding(
              padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text(
                        AppLocalizations.of(context).translate('autorization'),
                        style: TextStyle(fontFamily: 'Golos_SemiBold', fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 40),
                      CustomText(text: AppLocalizations.of(context).translate('specifyEmail')),
                      SizedBox(height: 10),
                      CustomTextField(text: AppLocalizations.of(context).translate('email')),
                      SizedBox(height: 16),
                      CustomText(text: AppLocalizations.of(context).translate('specifyPassword')),
                      SizedBox(height: 10),
                      CustomTextField(text: AppLocalizations.of(context).translate('password')),
                      Visibility(
                        visible: _isAlertMessageVisible,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(AppLocalizations.of(context)
                                    .translate('emailOrPasswordEnteredIncorrectly'),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Golos_Regular', fontSize: 13)
                                  ,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: ColorPalettes.lightGreen,
                              ),
                              child: Checkbox(
                                activeColor: ColorPalettes.lightGreen,
                                value: _isCheckboxChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isCheckboxChecked = !_isCheckboxChecked;
                                  });
                                },
                              ),
                            ),
                            Container(
                              transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                              child: Text(AppLocalizations.of(context)
                                  .translate('rememberMe'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Golos_Regular',
                                    fontSize: 13,
                                  )),),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              transform: Matrix4.translationValues(0.0, -31.0, 0.0),
                              child: Text(AppLocalizations.of(context)
                                  .translate('forgotYourPassword'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Golos_Regular',
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 20),
                      CustomButton(
                          text: AppLocalizations.of(context)
                              .translate('entrance'),
                          onPressed: () {
                            Navigation.intent(context, MyHomePage.routeName);
                          }
                      ),
                      SizedBox(height: 40),

                    ],
                  )),
            )));
  }
}