import 'package:flutter/material.dart';
import 'screen2.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.blue, title: const Text('Screen 1')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Screen2()));
            },
            child: const Text('Go to 2nd Page'),
          ),
        ));
  }
}
