import 'package:android_ios/common/styles/themes.dart';
import 'package:android_ios/core.dart';
import 'package:android_ios/ui/authorization_page.dart';
import 'package:android_ios/ui/home_page.dart';
import 'package:android_ios/ui/splash_screen.dart';
import 'package:android_ios/utils/app_constants.dart';
import 'package:android_ios/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) => inject<AuthorizationBloc>(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => inject<ThemeBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }


  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    context.select((ThemeBloc themeBloc) => themeBloc.add(GetTheme()));
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: state.isDarkTheme ? Themes.darkTheme : Themes.lightTheme,
      initialRoute: SplashScreen.routeName,

      // List all of the app's supported locales here
      supportedLocales: [
        Locale('ru', ''),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        MyHomePage.routeName: (context) => MyHomePage(title: AppConstants.appName),
        AuthorizationPage.routeName: (context) => AuthorizationPage(),

        // todo add remain pages here
      },
    );
  }


}
