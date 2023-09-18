import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiboard/cubit/main_cubit.dart';
import 'package:whiboard/cubit/main_states.dart';
import 'package:whiboard/widgets/shapes_widget.dart';
import 'package:whiboard/widgets/white_board.dart';
import 'package:whiteboard/whiteboard.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({
    super.key,
    required this.whiteBoardController,
    required this.shapeslist,
  });

  final WhiteBoardController whiteBoardController;
  final List shapeslist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          BlocBuilder<ImageCubit, ImageStates>(
            builder: (context, state) {
              if (state is ImagePickedSucessState) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(
                              BlocProvider.of<ImageCubit>(context).image!),
                          fit: BoxFit.fill)),
                );
              } else {
                return Shapes(
                  shapeslist: shapeslist,
                  shape: BlocProvider.of<ImageCubit>(context).shape,
                );
              }
            },
          ),
          WhiteBoardWidget(
              whiteBoardController: whiteBoardController,
              stroke: BlocProvider.of<SubjectCubit>(context).stroke,
              erase: BlocProvider.of<SubjectCubit>(context).erase),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: 90,
              child: ElevatedButton(
                  onPressed: () {
                    whiteBoardController.clear();
                    BlocProvider.of<ImageCubit>(context).showshape(0);
                  },
                  child: const Text('Clear')),
            ),
          ),
        ],
      ),
    );
  }
}
