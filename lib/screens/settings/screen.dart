import 'package:flutter/material.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
import 'package:stopat/widgets/buttons/tc_theme_mode_button.dart';
import 'package:stopat/widgets/tc_screen.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

  static void show(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const SettingsScreen();
        },
      ),
    );
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return TCScreen(
      headerProps: TCScreenHeaderProps(
        right: (context) {
          return TCIconButton(
            props: TCIconButtonProps.close(
              onTap: _onCloseTap,
            ),
          );
        },
      ),
      child: const Center(
        child: TCThemeModeButton(),
      ),
    );
  }

  void _onCloseTap() {
    Navigator.of(context).pop();
  }
}
