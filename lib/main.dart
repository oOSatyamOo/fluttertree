
import 'package:flutter/material.dart';

import 'views/home/home_view.dart';

// void main() => runApp(DevicePreview(child: MyApp()));
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView());
  }
}
