// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whiboard/cubit/main_cubit.dart';

class ShowShapesWidget extends StatelessWidget {
  const ShowShapesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          BlocProvider.of<ImageCubit>(context).showshapes();
        },
        icon: BlocProvider.of<ImageCubit>(context).shapes
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<ImageCubit>(context).showshape(1);
                    },
                    child: SvgPicture.asset(
                      width: 30,
                      'images/circle.svg',
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<ImageCubit>(context).showshape(2);
                    },
                    child: SvgPicture.asset(
                      width: 20,
                      'images/triangle.svg',
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        BlocProvider.of<ImageCubit>(context).showshape(3);
                      },
                      child: SvgPicture.asset(
                        'images/rectangle.svg',
                        width: 13,
                      )),
                ],
              )
            : SvgPicture.asset(
                'images/shapes.svg',
              ));
  }
}
