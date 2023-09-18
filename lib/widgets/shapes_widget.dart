import 'package:flutter/material.dart';

class Shapes extends StatelessWidget {
  const Shapes({
    super.key,
    required this.shapeslist,
    required this.shape,
  });

  final List shapeslist;
  final int shape;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: MediaQuery.of(context).size.width * .5,
      child: SizedBox(
        height: 0,
        child: CustomPaint(
          painter: shapeslist[shape],
          child: Container(),
        ),
      ),
    );
  }
}
