import 'package:flutter/material.dart';
import 'package:stopat/screens/settings/screen.dart';
import 'package:stopat/screens/setup_game.dart/screen.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/widgets/bottom_spacer.dart';
import 'package:stopat/widgets/buttons/tc_button.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
import 'package:stopat/widgets/clock_lottie.dart';
import 'package:stopat/widgets/tc_screen.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return TCScreen(
      headerProps: TCScreenHeaderProps(
        right: (context) {
          return TCIconButton(
            props: TCIconButtonProps.settings(
              onTap: _onSettingsTap,
            ),
          );
        },
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          const ClockLottieView(),
          const Spacer(),
          // TCButton(
          //   title: ls(LK.screen_home_btnDaily),
          //   onTap: _onDailyTap,
          // ),
          // SizedBox(height: 16.w(context)),
          TCButton(
            title: ls(LK.screen_home_btnClassic),
            onTap: _onClassicTap,
          ),
          // SizedBox(height: 16.w(context)),
          // TCButton(
          //   title: ls(LK.screen_home_btnCustom),
          //   onTap: _onCustomTap,
          // ),
          const BottomSpacer(),
        ],
      ),
    );
  }

  void _onSettingsTap() {
    SettingsScreen.show(context);
  }

  void _onDailyTap() {}

  void _onClassicTap() {
    SetupGameScreen.show(context);
  }

  void _onCustomTap() {}
}
