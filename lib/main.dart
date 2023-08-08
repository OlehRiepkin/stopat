import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopat/app.dart';
import 'package:stopat/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  // await sharedPreferences.clear();

  runApp(
    ProviderScope(
      observers: const [
        CustomProviderObserver(),
      ],
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: const TimeChallengeApp(),
      ),
    ),
  );
}
