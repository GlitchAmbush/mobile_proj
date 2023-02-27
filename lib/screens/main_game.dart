import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  int _count = constants.members;

  void update() {
    setState(() {
      constants.members++;
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red, title: const Text('Home')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Members Subscribed'),
              Text(
                '$_count Members',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: FloatingActionButton.large(
                    onPressed: update,
                    tooltip: 'Gain Members!',
                    child: const Icon(Icons.add)),
              )
            ],
          ),
        ));
  }
}
