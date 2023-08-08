import 'package:flutter/material.dart';
import 'package:stopat/screens/home/setup_game/modal.dart';
import 'package:stopat/screens/settings/screen.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/buttons/tc_button.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCButton(
              title: ls(LK.screen_home_btnDaily),
              onTap: _onDailyTap,
            ),
            SizedBox(height: 32.w(context)),
            TCButton(
              title: ls(LK.screen_home_btnClassic),
              onTap: _onClassicTap,
            ),
            SizedBox(height: 32.w(context)),
            TCButton(
              title: ls(LK.screen_home_btnCustom),
              onTap: _onCustomTap,
            ),
          ],
        ),
      ),
    );
  }

  void _onSettingsTap() {
    SettingsScreen.show(context);
  }

  void _onDailyTap() {}

  void _onClassicTap() {
    // GameScreen.show(context);

    SetupGameModal.show(context);
  }

  void _onCustomTap() {}
}
