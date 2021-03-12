import 'package:android_ios/bloc/neopanel_bloc_observer.dart';
import 'package:android_ios/network/api/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:android_ios/core.dart' as di;
import 'app_config.dart';
import 'neopanel_app.dart';

void main() async {
  Bloc.observer = NeoPanelBlocObserver();
  Config.appFlavor = Flavor.RELEASE;
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(ApiConstants.baseUrl);
  runApp(MyApp());
}

