import 'dart:ui';

import 'package:flutter/material.dart';
//https://neumorphism.coldstone.fun/#/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = false;
  late Offset distance ;
  late double blur;
  @override
  void initState() {
    distance = isPressed?Offset(10,10):Offset(25, 25);
    blur=isPressed?5.0:30.0;
    super.initState();
  }
  final bgColor = const Color(0xFFE7ECEF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: InkWell(
          onTap: ()=>setState(() {
            isPressed=!isPressed;
          }),
          onHover: (v)=>setState(()=>isPressed=v),
          child: Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:bgColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance,

                    color: bgColor,),
                  BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: Color(0xFFa7A9AF)
                  )]
            ),
            child: SizedBox(

              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
