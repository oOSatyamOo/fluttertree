import 'package:flutter/material.dart';

import 'package:fluttertree/widgets/appdrawer/appdrawer.dart'show drawerOptionsList;

class AppDrawerTabletPortrait extends StatelessWidget {
  const AppDrawerTabletPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  130.0,
      decoration:const BoxDecoration(color: Colors.white,
        boxShadow: [BoxShadow(
            blurRadius: 16.0,
            color: Colors.black12
        )],
      ),
      child: Row(
        children: drawerOptionsList,
      ),
    );
  }
}

class AppDrawerTabletLandScape extends StatelessWidget {
  const AppDrawerTabletLandScape({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 250.0,
      decoration:const BoxDecoration(color: Colors.white,
        boxShadow: [BoxShadow(
            blurRadius: 16.0,
            color: Colors.black12
        )],
      ),
      child: Column(
        children: drawerOptionsList,
      ),
    );
  }
}
