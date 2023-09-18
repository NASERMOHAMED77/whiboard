import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whiboard/cubit/main_cubit.dart';
import 'package:whiboard/cubit/main_states.dart';
import 'package:whiboard/shapes/circle.dart';
import 'package:whiboard/shapes/rectangle.dart';
import 'package:whiboard/shapes/triangle.dart';
import 'package:whiboard/widgets/bottom_bar.dart';
import 'package:whiboard/widgets/screen_body.dart';
import 'package:whiboard/widgets/top_bar.dart';
import 'package:whiteboard/whiteboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SubjectCubit()),
        BlocProvider(create: (context) => ImageCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'title'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WhiteBoardController whiteBoardController = WhiteBoardController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List shapeslist = [
      null,
      CirclePainter(),
      TrianglePainter(),
      RectanglePainter(),
    ];
    return Scaffold(
      body: BlocConsumer<SubjectCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: SafeArea(
              child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopBar(),
                        ScreenBody(
                            whiteBoardController: whiteBoardController,
                            shapeslist: shapeslist),
                        BottomRowMenu(
                            whiteBoardController: whiteBoardController)
                      ])),
            ),
          );
        },
      ),
    );
  }
}
