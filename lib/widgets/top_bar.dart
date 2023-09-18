import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiboard/cubit/main_cubit.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * .35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 220, 219, 220).withOpacity(.1),
            ),
            child: const Text(
              'WhiteBoard',
              style: TextStyle(
                color: Color.fromARGB(255, 103, 42, 174),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Slider(
                    label: BlocProvider.of<SubjectCubit>(context, listen: true)
                        .stroke
                        .round()
                        .toString(),
                    max: 20,
                    divisions: 7,
                    min: 2,
                    autofocus: true,
                    value: BlocProvider.of<SubjectCubit>(context).stroke,
                    onChanged: (value) {
                      BlocProvider.of<SubjectCubit>(context, listen: false)
                          .x(value);
                    }),
              ),
              const Icon(Icons.text_fields)
            ],
          ),
        )
      ],
    );
  }
}
