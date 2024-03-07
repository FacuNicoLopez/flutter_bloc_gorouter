import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';

class UserNameCubit extends Cubit<String> {
  UserNameCubit() : super('username');

  void setUsername(String username) {
    emit(username);
  }
}

// class ColorCubit extends Cubit<Color> {
//   ColorCubit() : super(Colors.white);

//   void setColor(Color color) {
//     emit(color);
//   }
// }
