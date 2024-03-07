import 'package:flutter/material.dart';
import 'package:flutter_application_3/app_router.dart';
import 'package:flutter_application_3/page2.dart';
import 'package:flutter_application_3/usernamecubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<ColorCubit>().state;
    final username = context.read<UserNameCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('States'),
      ),
      backgroundColor: color,
      body: Center(
          child: Text(
        'Last name: $username',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 34,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RouterSimpleCubit>().goBack();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}
