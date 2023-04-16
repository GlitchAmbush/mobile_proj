import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;

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
            title: Text('HoloCoins: ${user.holoCoins}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: user.collection.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
  height: 50,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.purple),
    color: Colors.blue,
  ),
  child: Center(
    child: Text(
      'Idol: ${user.collection[index]}',
      style: const TextStyle(color: Colors.white),
    ),
  ),
);

            }));
  }
} 
