import 'package:flutter/material.dart';

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
  const MyHomePage({super.key,  this.shadowColor= Colors.purple});

 final Color shadowColor;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  void initState() {
    bgColor = widget.shadowColor.withOpacity(0.7);

    super.initState();
  }
bool isPressed = false;
late Color bgColor ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body:Center(
        child: Listener(
          onPointerDown: (v)=>setState(() =>isPressed=true),
          onPointerUp: (v)=>setState(() => isPressed = false),
          child: AnimatedContainer(
            duration:const Duration(milliseconds: 500),

            decoration: BoxDecoration(
                color: isPressed?bgColor:null,
              borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    for(int i =1;i<5;i++)
                    BoxShadow(
                      spreadRadius: -1,
                      color: widget.shadowColor,
                      blurRadius: (isPressed?5.0:3.0)*i,
                      blurStyle: BlurStyle.outer
                    ),
                    for(int i =1;i<5;i++)
                      BoxShadow(
                          spreadRadius: -1,
                          color: widget.shadowColor,
                          blurRadius: (isPressed?5.0:3.0)*i,
                          blurStyle: BlurStyle.outer
                      )
                ]
            ),
            child: TextButton(
              onPressed: (){},
              onHover: (v)=>setState(()=>isPressed=v),
              style: TextButton.styleFrom(
            side: BorderSide(
            color: Colors.white,
                width: 4.0
            ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),),
              child: Text(
                'Neon Button',
                style: TextStyle(

                  shadows: [
                   for(int i =1;i<(isPressed?8:4);i++)
                     Shadow(
                        color: widget.shadowColor,
                        blurRadius: 3.0*i
                    ),

                  ],
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ) );
  }
}
