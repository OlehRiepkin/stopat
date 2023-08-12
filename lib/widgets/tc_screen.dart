import 'package:flutter/material.dart';
import 'package:stopat/widgets/background.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class TCScreen extends StatelessWidget {
  const TCScreen({
    required this.child,
    this.headerProps,
    super.key,
  });

  final Widget child;
  final TCScreenHeaderProps? headerProps;

  @override
  Widget build(BuildContext context) {
    final headerProps = this.headerProps;

    return Scaffold(
      body: TCBackground(
        child: Column(
          children: [
            if (headerProps != null)
              TCScreenHeader(
                props: headerProps,
              ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
