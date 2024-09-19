import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   bottomNavigationBar: CustomBottomNavigationBar(),
      appBar: AppBar(title: const Text('Home')),
    );
  }
}
