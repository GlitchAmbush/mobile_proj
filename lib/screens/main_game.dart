import 'package:flutter/material.dart';

class MainGame extends StatelessWidget {
  const MainGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.red, title: const Text('MainGame')),
      body: const Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
