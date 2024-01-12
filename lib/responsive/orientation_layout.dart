import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({super.key, this.portrait, this.landscap});
final Widget? portrait;
final Widget? landscap;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if(orientation==Orientation.landscape){
     if(landscap!=null) {
       return landscap!;//??portrait;
     }
    }
    return portrait!;
  }
}
