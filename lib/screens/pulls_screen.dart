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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('$bannerName Banner')),
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
              return Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text('Idol:   ${_names?[index].toString()}\n'
                            'Rate:   ${_rates?[index].toString()}'),
                      ],
                    ),
                  ));
            }));
  }
}
