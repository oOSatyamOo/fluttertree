// export as transparent png image

// void main() => runApp(DevicePreview(child: MyApp()));
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:widget_mask/widget_mask.dart';

void main() => runApp(const MaskFDev());

class MaskFDev extends StatelessWidget {
  const MaskFDev({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetMask(
        blendMode: BlendMode.srcATop,
        childSaveLayer: true,
        mask: Image.asset(
          'asset/im.jpg',
          // width: 100,
        ),
        child: Image.asset(
          'asset/custom.png',
          // width: 100,
          scale: .3,
        ));
  }
}
