import 'package:flutter/material.dart';
import 'package:fluttertree/widgets/appdrawer/appdrawer.dart';

class HomeViewTabletPortrait extends StatelessWidget {
  const HomeViewTabletPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        ),
        const AppDrawer(),

      ],
    );
  }
}

class HomeViewTabletLandscape extends StatelessWidget {
  const HomeViewTabletLandscape({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Row(
        children: [
          const AppDrawer(),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),

        ],
      ),
    );
  }
}
