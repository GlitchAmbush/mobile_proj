import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;
import 'pulls_screen.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _firstController = ScrollController();

  final _list = constants.bannerTitle.keys.toList();

  void _goToPulls(BuildContext context, String selectedBanner) {
    if (constants.bannerTitle.containsKey(selectedBanner)) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => PullsScreen(
                idolList: selectedBanner,
              ))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Subs: ${constants.subs}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(150)),
                    onPressed: () => _goToPulls(context, _list[index]),
                    child: Text(_list[index])),
              );
            }));
  }
}
