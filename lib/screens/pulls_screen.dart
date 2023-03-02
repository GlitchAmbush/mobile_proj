import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;

class PullsScreen extends StatefulWidget {
  final String idolList;
  const PullsScreen({Key? key, required this.idolList}) : super(key: key);

  @override
  State<PullsScreen> createState() => _PullsScreenState();
}

class _PullsScreenState extends State<PullsScreen> {
  late String bannerName = widget.idolList;
  late final Map? _list = constants.bannerTitle[bannerName];
  late final int? _count = constants.bannerTitle[bannerName]?.length;
  late final List? _names = _list?.keys.toList();
  late final List? _rates = _list?.values.toList();

  void _gachaRoll(bool tenTimes) {
    if (tenTimes) setState(() => constants.holoCoins -= 100);

    setState(() => constants.holoCoins -= 10);
  }

  double _convertToPercent(double val) {
    return (val * 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('$bannerName Banner'),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'HoloCoins: ${constants.holoCoins}',
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 102, 183, 250),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (constants.holoCoins >= 10) {
                      _gachaRoll(false);
                    } else {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text('Insufficient Members!'),
                                content: const Text(
                                    'You have insufficient members to recruit a new idol to your company!'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'))
                                ],
                              )));
                    }
                  },
                  child: const Text(
                    'Recruit Idol\nx1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (constants.holoCoins >= 100) {
                      _gachaRoll(true);
                    } else {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text('Insufficient Members!'),
                                content: const Text(
                                    'You have insufficient members to recruit a new idol to your company!'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'))
                                ],
                              )));
                    }
                  },
                  child: const Text(
                    'Recruit Idol\nx10',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: _count! + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 150,
                  color: Colors.red,
                  child: const Text('Insert Banner Image Here'),
                );
              }

              index -= 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Container(
                    height: 80,
                    color: Colors.amber[600],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text('Idol:   ${_names?[index].toString()}\n'
                              'Rate:  ${_convertToPercent(_rates?[index]).toString()}%'),
                        ],
                      ),
                    )),
              );
            }));
  }
}