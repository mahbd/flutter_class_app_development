import 'package:flutter/material.dart';
import 'package:responsive/responsive/desktop_view.dart';
import 'package:responsive/responsive/mobile_view.dart';
import 'package:responsive/responsive/tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 760) {
              return const MobileView();
            } else if (constraints.maxWidth < 1280) {
              return const TabView();
            } else {
              return const DesktopView();
            }
          },
        ),
      ),
    );
  }
}
