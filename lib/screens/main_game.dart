import 'package:flutter/material.dart';
import 'achievements_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/user_data.dart' as user;
import 'dart:async';
import 'dart:io';

class MainGame extends StatefulWidget {
  const MainGame({super.key});

  @override
  State<MainGame> createState() => _MainGameState();
}



class _MainGameState extends State<MainGame> {
  int _count = user.holoCoins;
  int _timedCount = 0;
  double _average = 0;
  Timer? timer;
  int arr = achievmentList.length;

  void update() {
    setState(() {
      user.holoCoins++;
      _count++;
      _timedCount++;
      man();
      if (achievmentList.length > arr){
        arr = achievmentList.length;
                    OverlayEntry overlayEntry = OverlayEntry(
              builder: (BuildContext context) => Positioned(
                top: MediaQuery.of(context).size.height * 0.8,
                left: MediaQuery.of(context).size.width - 200, // Set the left property to shift the overlay to the right side of the screen
                child: Material(
                  child: Container(
                    height: 60.0,
                    width: 200.0,
                    color: Colors.grey,
                    child: const Center(
                      child: Text('New achievement!'),
                    ),
                  ),
                ),
              ),
            );
            Overlay.of(context).insert(overlayEntry);
            Future.delayed(const Duration(seconds: 3)).then((_) {
              overlayEntry.remove();
            });
      }});
  }
  

  void averageClicks() {
    if (mounted) {
      if (_timedCount == 0) {
        _average = 0;
      } else {
        _average = _timedCount / 3;
      }
    }
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
              Text('$_average HoloCoins/second'),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: FloatingActionButton.large(
                    onPressed: update,
                    tooltip: 'Gain HoloCoins!',
                    child: const Icon(Icons.add)),
              ),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setInt('counter', _count);
                  },
                  child: const Text('Save Data')),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        setState(() {
                          _count = prefs.getInt('counter')!;
                        });
                  },
                  child: const Text('load Data'))
            ],
          ),
        ));
  }
}
