import 'package:flutter/material.dart';

import '../../widgets/appdrawer/appdrawer.dart';

class HomeViewMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();
   HomeViewMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child:IconButton(onPressed:(){
              _scaffoldKey.currentState!.openDrawer();
            }, icon:Icon(Icons.menu),)
          )
        ],
      ),
    );
  }
}
class HomeViewMobileLandscape extends StatelessWidget {
  const HomeViewMobileLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          AppDrawer()
        ],
      ),
    );
  }
}

