import 'package:flutter/material.dart';
import '../util/banner_data.dart' as banner;
import '../util/user_data.dart' as user;
import 'pulls_screen.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _firstController = ScrollController();

  final _list = banner.bannerTitle.keys.toList();

  void _goToPulls(BuildContext context, String selectedBanner) {
    if (banner.bannerTitle.containsKey(selectedBanner)) {
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
          title: const Text('Recruiting'),
        ),
        body: ListView.builder(
            controller: _firstController,
            itemCount: _list.length,
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
