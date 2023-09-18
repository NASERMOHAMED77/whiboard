// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whiboard/cubit/main_cubit.dart';
import 'package:whiboard/widgets/show_shapes_widget.dart';
import 'package:whiteboard/whiteboard.dart';

class BottomRowMenu extends StatelessWidget {
  const BottomRowMenu({
    super.key,
    required this.whiteBoardController,
  });

  final WhiteBoardController whiteBoardController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<SubjectCubit>(context).writeBoard();
                    },
                    icon: SvgPicture.asset(
                      'images/pen.svg',
                      color: BlocProvider.of<SubjectCubit>(context).erase
                          ? null
                          : Colors.purple,
                    )),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<SubjectCubit>(context).eraseBoard();
                    },
                    icon: SvgPicture.asset(
                      'images/erase.svg',
                      color: BlocProvider.of<SubjectCubit>(context).erase
                          ? Colors.purple
                          : null,
                    )),
                IconButton(
                    onPressed: () {
                      whiteBoardController.undo();
                    },
                    icon: const Icon(Icons.undo)),
                IconButton(
                    onPressed: () {
                      whiteBoardController.redo();
                    },
                    icon: const Icon(Icons.redo)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<ImageCubit>(context).pickimage();
                    },
                    icon: const Icon(Icons.image)),
                ShowShapesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
