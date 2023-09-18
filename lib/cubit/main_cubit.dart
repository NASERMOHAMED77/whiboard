import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whiboard/cubit/main_states.dart';

class SubjectCubit extends Cubit<MainStates> {
  SubjectCubit() : super(LoadingState());
  double stroke = 10;
  int shape = 0;
  bool erase = false;
  bool shapes = false;
  x(double value) {
    stroke = value;
    emit(SucessState());
  }

  eraseBoard() {
    erase = true;
    emit(SucessState());
  }

  writeBoard() {
    erase = false;
    emit(SucessState());
  }

  
}

class ImageCubit extends Cubit<ImageStates> {
  ImageCubit() : super(ImagePickedLoadingState());
  File? image;
  int shape = 0;
  bool shapes = false;
  pickimage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    image = File(pickedImage!.path);
    emit(ImagePickedSucessState());
  }
  showshapes() {
    shapes = true;
    emit(ShowShapeState());
  }

  showshape(int num) {
    shape = num;
    emit(ShowShapeState());
  }
}
