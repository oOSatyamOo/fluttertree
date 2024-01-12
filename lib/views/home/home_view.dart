import 'package:flutter/material.dart';
import 'package:fluttertree/responsive/orientation_layout.dart';
import 'package:fluttertree/responsive/screen_type_layout.dart';
import 'package:fluttertree/views/home/homeview_m.dart';
import 'package:fluttertree/views/home/homeview_t.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeViewMobilePortrait(),
        landscap: const HomeViewMobileLandscape(),
      ),
      tablet:const OrientationLayout(
        portrait: HomeViewTabletPortrait(),
        landscap: HomeViewTabletLandscape(),
      ),
    );
  }
}
