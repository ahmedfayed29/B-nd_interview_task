import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/core/caching_utils/caching_utils.dart';
import 'package:hr_app/my_app.dart';

import 'core/firebase_messaging_utils/firebase_messaging_utils.dart';
import 'core/network_utils/network_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.value([
    await NetworkUtils.init(),
    await EasyLocalization.ensureInitialized(),
    await CachingUtils.init(),
    await Firebase.initializeApp(),
    await FirebaseMessagingUtils.instance.init(),
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}
