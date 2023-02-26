import 'package:flutter/material.dart';

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  @override
  Widget build(BuildContext context) {
    int counter = 0;

    void incrementCounter() {
      setState(() => counter++);
    }

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red, title: const Text('Home')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Members Subscribed'),
              Text(
                '1.09mil Members',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: FloatingActionButton.large(
                    onPressed: incrementCounter,
                    tooltip: 'Gain Members!',
                    child: const Icon(Icons.add)),
              )
            ],
          ),
        ));
  }
}
