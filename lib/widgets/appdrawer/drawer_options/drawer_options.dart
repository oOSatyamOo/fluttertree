import 'package:flutter/material.dart';
import 'package:fluttertree/responsive/orientation_layout.dart';
import 'package:fluttertree/responsive/screen_type_layout.dart';
import 'package:fluttertree/widgets/appdrawer/drawer_options/drawer_options_t.dart';

import 'drawer_options_m.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({super.key, required this.title, required this.icon});
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: DrawerOptionMobilePortrait(
          icon: icon,
          title: title,
        ),
        landscap: DrawerOptionMobileLandscape(
          title: title,
          icon: icon,
        ),
      ),
      tablet: OrientationLayout(
        portrait: DrawerOptionTabPort(
          title:title,
          icon: icon,
        ),
        landscap: DrawerOptionMobilePortrait(
          title: title,
          icon: icon,
        ),
      ),
    );
  }
}
