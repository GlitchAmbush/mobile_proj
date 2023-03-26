import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;
import 'dart:async';

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  int _count = constants.holoCoins;
  int _timedCount = 0;
  double _average = 0;
  Timer? timer;

  void update() {
    setState(() {
      constants.holoCoins++;
      _count++;
      _timedCount++;
    });
  }

  void averageClicks() {
    setState(() {
      _average = _timedCount / 3;
      _timedCount = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => averageClicks());
  }

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
              const Text('HoloCoins Earned'),
              Text(
                '$_count HoloCoins',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text('${_average.toStringAsFixed(2)} HoloCoins/second'),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: FloatingActionButton.large(
                    onPressed: update,
                    tooltip: 'Gain HoloCoins!',
                    child: const Icon(Icons.add)),
              )
            ],
          ),
        ));
  }
}
