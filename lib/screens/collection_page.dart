import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('HoloCoins: ${constants.holoCoins}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.purple)),
                child: Center(child: Text('Collectionr $index \nlorum ipsum')),
              );
            }));
  }
}
