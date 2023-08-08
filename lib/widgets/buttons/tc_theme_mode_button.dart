import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';

class TCThemeModeButton extends StatelessWidget {
  const TCThemeModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final themeMode = ref.watch(appThemeProvider);

        final icon = switch (themeMode.value) {
          ThemeMode.light => Icons.dark_mode_outlined,
          ThemeMode.dark => Icons.light_mode_outlined,
          _ => Icons.dark_mode_outlined,
        };

        return TCIconButton(
          props: TCIconButtonProps(
            onTap: () {
              ref.read(appThemeProvider.notifier).toggleTheme();
            },
            icon: icon,
          ),
        );
      },
    );
  }
}
