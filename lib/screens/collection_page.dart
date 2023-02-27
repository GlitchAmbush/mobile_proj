import 'package:flutter/material.dart';

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
          backgroundColor: Colors.purple[300],
          title: const Text('Collection'),
        ),
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
