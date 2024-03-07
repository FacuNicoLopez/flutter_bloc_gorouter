// import 'dart:html';
// import 'dart:math';

// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_application_3/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hovering/hovering.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, color) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('You are changing colors'),
          ),
          backgroundColor: color, // Usa el color del estado
          body: Center(
            child: IconButton(
              hoverColor:
                  const Color.fromARGB(255, 12, 12, 12).withOpacity(0.3),
              icon: const Icon(
                Icons.refresh,
                size: 100,
                color: Colors.white,
              ),
              onPressed: () => context.read<ColorCubit>().changeColor(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<RouterSimpleCubit>().goBack();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        );
      },
    );
  }
}

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.blue); // Color inicial

  void changeColor() {
    final Random random = Random();
    // Genera un color aleatorio
    emit(Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1));
  }
}
