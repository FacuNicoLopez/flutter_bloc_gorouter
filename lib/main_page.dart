import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(title: 'Change Names', location: '/page1'),
        _CustomListTile(title: 'Change Color', location: '/page2'),
        _CustomListTile(title: 'States', location: '/page3'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
