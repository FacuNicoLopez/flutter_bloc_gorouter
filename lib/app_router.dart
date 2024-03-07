import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_3/screen.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/page1',
    builder: (context, state) => const Page1(),
  ),
  GoRoute(
    path: '/page2',
    builder: (context, state) => const Page2(),
  ),
  GoRoute(
    path: '/page3',
    builder: (context, state) => const Page3(),
  ),
]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_publicRouter);

  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }
}
