import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            ElevatedButton(onPressed: () {}, child: const Text('Download now')),
      ),
    );
  }
}