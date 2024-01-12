import 'package:flutter/material.dart';
import 'package:fluttertree/responsive/orientation_layout.dart';
import 'package:fluttertree/responsive/screen_type_layout.dart';
import 'package:fluttertree/widgets/appdrawer/appdrawer_t.dart';
import 'package:fluttertree/widgets/appdrawer/drawer_options/drawer_options.dart';

import 'appdrawer_m.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
  return ScreenTypeLayout(
    mobile: AppDrawerMobile(),
    tablet: OrientationLayout(
      portrait: AppDrawerTabletPortrait(),
      landscap: AppDrawerTabletLandScape(),
    ),
  );
  }
}

List<DrawerOption> get drawerOptionsList=> [
  DrawerOption(title: 'Image', icon: Icons.image),
  DrawerOption(title: 'Reports', icon: Icons.photo_filter),
  DrawerOption(title: 'Summery', icon: Icons.message),
  DrawerOption(title: 'Settings', icon: Icons.settings)
];