import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/screens/home/screen.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class TimeChallengeApp extends StatelessWidget {
  const TimeChallengeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleHelper(
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final themeMode = ref.watch(appThemeProvider);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: ls(LK.common_appName),
              theme: AppThemeData.light(),
              darkTheme: AppThemeData.dark(),
              themeMode: themeMode.value,
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
