import 'package:flutter/material.dart';
import '../nav/navigation.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: const Text('Gatcha!VTuber')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigation()));
                },
                child: const Text('Play'),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Credits'),
                            content: SingleChildScrollView(
                              child: ListBody(children: const [
                                Text('Lemuel Javier'),
                                Text('Ronal Rodriguez'),
                                Text('Mitish Mistry'),
                                Text('Kym Michael Gripal')
                              ]),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ]);
                      });
                },
                child: const Text('Credits'),
              ),
            ],
          ),
        ));
  }
}
