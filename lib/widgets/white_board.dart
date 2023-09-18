import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

class WhiteBoardWidget extends StatelessWidget {
  const WhiteBoardWidget({
    super.key,
    required this.whiteBoardController,
    required this.stroke,
    required this.erase,
  });

  final WhiteBoardController whiteBoardController;
  final double stroke;
  final bool erase;

  @override
  Widget build(BuildContext context) {
    return WhiteBoard(
      // background Color of white board
      backgroundColor: Colors.black.withOpacity(.1),
      // Controller for action on whiteboard
      controller: whiteBoardController,
      // Stroke width of freehand
      strokeWidth: stroke,
      // Stroke color of freehand
      strokeColor: Colors.green,
      // For Eraser mode
      isErasing: erase,
      // Save image
      onConvertImage: (list) {},
      // Callback common for redo or undo
      onRedoUndo: (t, m) {},
    );
  }
}
