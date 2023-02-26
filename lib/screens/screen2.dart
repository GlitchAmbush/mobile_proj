import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    // Disables Back Button (implement in the future)
    /*return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.red, title: const Text('Screen 2'),
                automaticallyImplyLeading: true),
            body: const Center(
              child: Text('Welcome!'),
            )),
        onWillPop: () async {
          return false;
        });
  }*/

    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.red, title: const Text('Screen 2')),
        body: const Center(
          child: Text('Welcome!'),
        ));
  }
}
