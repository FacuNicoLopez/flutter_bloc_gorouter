// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/usernamecubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_name_generator/random_name_generator.dart';

import 'app_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You are changing names'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<UserNameCubit, String>(builder: (context, state) {
              return Text(
                state,
                style: const TextStyle(
                  fontSize: 60,
                  color: Color.fromRGBO(22, 9, 80, 1),
                ),
              );
            }),
            const SizedBox(height: 20),
            IconButton(
              hoverColor:
                  const Color.fromARGB(255, 23, 71, 80).withOpacity(0.3),
              icon: const Icon(
                Icons.refresh,
                size: 100,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () => context
                  .read<UserNameCubit>()
                  .setUsername(RandomGenerator.getRandomName()),

              // FloatingActionButton(
              //   onPressed: () {
              //     context
              //         .read<UserNameCubit>()
              //         .setUsername(RandomGenerator.getRandomName());
              //   },
              //   child: const Icon(Icons.refresh_sharp),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RouterSimpleCubit>().goBack();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),

      // body: Center(
      //   child: BlocBuilder<UserNameCubit, String>(
      //     buildWhen: (previous, current) =>
      //         previous != current, //evita que se repita el name
      //     builder: (context, state) {
      //       return Text(state,
      //           style: const TextStyle(
      //             fontSize: 30,
      //             color: Color.fromRGBO(79, 13, 202, 1),
      //           ));
      //     },
      //   ),
      // ),
      // floatingActionButton: Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     Positioned(
      //       bottom: 80,
      //       right: 10,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           context
      //               .read<UserNameCubit>()
      //               .setUsername(RandomGenerator.getRandomName());
      //         },
      //         child: const Icon(
      //           Icons.refresh,
      //           size: 36,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 10,
      //       right: 10,
      //       child: FloatingActionButton(
      //         onPressed: () {
      //           context.read<RouterSimpleCubit>().goBack();
      //         },
      //         child: const Icon(Icons.arrow_back_ios_new_rounded),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.brazil);
    return randomNames.fullName();
  }

  static Stream<String> randomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) => getRandomName())
        .take(15);
  }
}
