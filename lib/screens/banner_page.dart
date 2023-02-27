import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Subs: ${constants.members}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(150)),
                    onPressed: () {},
                    child: Text('Banner $index')),
              );
            }));
  }
}
