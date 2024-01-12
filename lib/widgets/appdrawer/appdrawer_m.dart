import 'package:flutter/material.dart';
  import 'package:fluttertree/widgets/appdrawer/appdrawer.dart'show drawerOptionsList;

class AppDrawerMobile extends StatelessWidget {
  const AppDrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).orientation==Orientation.portrait? 250:130.0,
      decoration:const BoxDecoration(color: Colors.white,
        boxShadow: [BoxShadow(
            blurRadius: 16.0,
            color: Colors.black12
        )],
      ),
      child: Column(children: drawerOptionsList,),
    );
  }
}
