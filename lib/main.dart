import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen.dart';
import 'package:flutter_application_3/usernamecubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserNameCubit(), lazy: true),
        BlocProvider(create: (context) => RouterSimpleCubit()),
        BlocProvider(create: (context) => ColorCubit()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;

    return MaterialApp.router(
      title: 'First Page',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
