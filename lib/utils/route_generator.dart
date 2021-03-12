import 'package:android_ios/ui/authorization_page.dart';
import 'package:android_ios/ui/RegistrationPage.dart';
import 'package:android_ios/ui/home_page.dart';
import 'package:android_ios/utils/app_constants.dart';

import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;

    switch (settings.name) {
      case AppConstants.AUTHORIZATION_PAGE:
        return MaterialPageRoute(builder: (_) => AuthorizationPage());
      case '/registrationPage':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => RegistrationPage(),);

      case AppConstants.HOME_PAGE:
      // Validation of correct data type
        return MaterialPageRoute(builder: (_) => MyHomePage(),);
        //if (args is String) {
        //  return MaterialPageRoute(
        //    builder: (_) => RegistrationPage(),
        //  );
        //}

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('OOPS ERROR'),
        ),
      );
    });
  }
}
