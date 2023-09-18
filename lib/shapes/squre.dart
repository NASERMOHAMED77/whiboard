import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImageEditor extends CustomPainter {

  ImageEditor({
   required this.image,
  });

  ui.Image image;

  List<Offset> points=[];

  final Paint painter = new Paint()
    ..color = Colors.blue[400]!
    ..style = PaintingStyle.fill;

  void update(Offset offset){
    points.add(offset);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image,  Offset(0.0, 0.0),  Paint());
    for(Offset offset in points){
      canvas.drawCircle(offset, 10, painter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}