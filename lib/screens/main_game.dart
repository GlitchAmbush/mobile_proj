import 'package:flutter/material.dart';

class MainGame extends StatefulWidget {
  final Function() update;
  final int count;

  const MainGame({super.key, required this.update, required this.count});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
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
                '${widget.count} Members',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: FloatingActionButton.large(
                    onPressed: () => widget.update,
                    tooltip: 'Gain Members!',
                    child: const Icon(Icons.add)),
              )
            ],
          ),
        ));
  }
}
