import 'package:flutter/material.dart';

class DrawerOptionMobilePortrait extends StatelessWidget {
  const DrawerOptionMobilePortrait({super.key, required this.title, required this.icon});
final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(icon),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}

class DrawerOptionMobileLandscape extends StatelessWidget {
  const DrawerOptionMobileLandscape({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child:  Tooltip(
            message: title,
            child: Icon(icon))
    );
  }
}
