import 'package:flutter/material.dart';
import 'package:fluttertree/enums/device_screen_type.dart';
import 'package:fluttertree/responsive/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  const ScreenTypeLayout({super.key, this.mobile, this.tablet, this.desktop});
final Widget? mobile;
final Widget? desktop;
final Widget? tablet;
  @override
  Widget build(BuildContext context) {
    return  ResponsiveBuilder(
        builder: (context,sizeInfo){
          if(sizeInfo.deviceScreenType==DeviceScreenType.Mobile){
            if(mobile!=null){
              return mobile!;
            }
          }else if(sizeInfo.deviceScreenType==DeviceScreenType.Tablet){
            if(tablet!=null){
              return tablet!;
            }
          }
          return desktop!;

        });
  }
}
