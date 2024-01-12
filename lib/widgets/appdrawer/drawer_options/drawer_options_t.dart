import 'package:flutter/material.dart';

class DrawerOptionTabPort extends StatelessWidget {
  const DrawerOptionTabPort({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 130.0,
      child: Column(
        children: [
          Icon(icon),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
