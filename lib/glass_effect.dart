import 'dart:ui';

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
  const MyHomePage({super.key });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      decoration:BoxDecoration(
          color:Colors.deepOrange.shade300,
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.macphun.com/img/uploads/customer/how-to/608/15542038745ca344e267fb80.28757312.jpg'
              ),
              fit:BoxFit.cover
          )
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            //blur
            filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                //another image opacity
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'
                      ),
                      fit:BoxFit.cover,
                      opacity: 0.25
                  ),
                  //boxShadow
                  boxShadow: [
                    BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.4),
                        blurRadius: 25,
                        spreadRadius: -5
                    )
                  ],
                  //gradient color
                  gradient: LinearGradient(
                    colors: const [Color(0xffF99E43), Color(0xffDA2323)],),
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2.0,color: Colors.white30)
              ),
              child: Icon(Icons.tv,size: 40,),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
