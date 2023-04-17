import 'package:flutter/material.dart';
import 'achievements_page.dart';
import '../util/user_data.dart' as user;
import 'dart:async';
import '../util/save_file.dart';

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  num _count = user.holoCoins;
  num _timedCount = 0;
  double _average = 0;
  Timer? timer;
  int arr = user.achievements.length;

  void update() {
    setState(() {
      user.holoCoins += (user.passiveIncome.round());
      _count += user.passiveIncome;
      _timedCount += user.passiveIncome;
      setAchievments();
      checkAchievement();
    });
  }

  void click() {
    setState(() {
      user.holoCoins += (user.onClickIncome.round());
      _count += user.onClickIncome;
      _timedCount += user.onClickIncome;
    });
  }

  void averageClicks() {
    if (mounted) {
      if (_timedCount == 0) {
        _average = 0;
      } else {
        _average = _timedCount / 1;
        _timedCount = 0;
      }
    }
  }

  void checkAchievement() {
    if (user.achievements.length > arr) {
      arr = user.achievements.length;
      OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          top: MediaQuery.of(context).size.height * 0.8,
          left: MediaQuery.of(context).size.width - 200,
          child: Material(
            child: Container(
              height: 60.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                child: Text(
                  'New achievement!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(overlayEntry);
      Future.delayed(const Duration(seconds: 3)).then((_) {
        overlayEntry.remove();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      averageClicks();
      update();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<bool> saveData() async {
    if (await saveVariablesToFile({
      'achievements': user.achievements,
      'collection': user.collection,
      'holoCoins': user.holoCoins,
      'onClickIncome': user.onClickIncome,
      'passiveIncome': user.passiveIncome,
      'ugprades': user.ugprades
    })) {
      return true;
    } else {
      return false;
    }
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
                    onPressed: () {
                      click();
                    },
                    tooltip: 'Gain HoloCoins!',
                    child: const Icon(Icons.add)),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (await saveData()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data saved successfully!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Save Data')),
              ElevatedButton(onPressed: () {}, child: const Text('load Data'))
            ],
          ),
        ));
  }
}
