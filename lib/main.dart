// void main() => runApp(DevicePreview(child: MyApp()));
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    return const Scaffold(
      body: Masking(
        image: AssetImage('asset/im.jpg'),
        child: Text(
          'MASK',
          style: TextStyle(
              fontSize: 200, wordSpacing: 2.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Masking extends StatelessWidget {
  const Masking({super.key, required this.image, required this.child});
  final ImageProvider image;
  final Text child;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snap) {
          return ShaderMask(
            blendMode: BlendMode.dstATop,
            shaderCallback: (react) {
              return ImageShader(snap.data!, TileMode.clamp, TileMode.clamp,
                  Matrix4.identity().storage);
            },
            child: child,
          );
        });
  }

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));

    return completer.future;
  }
}
