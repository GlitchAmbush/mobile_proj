import 'package:flutter/material.dart';
import '../util/banner_data.dart' as banner;
import 'pulls_screen.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final ScrollController _firstController = ScrollController();

  final _list = banner.bannerTitle.keys.toList();

  // To explain briefly,
  // this checks to see if a key in the bannerTitle Map exists
  // then pushes into the pulls_screen while passing the idolList data into it.
  // Lemuel Javier (101168735)
  void _goToPulls(BuildContext context, String selectedBanner) {
    if (banner.bannerTitle.containsKey(selectedBanner)) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => PullsScreen(
                idolList: selectedBanner,
              ))));
    }
  }

  // This widget displays all existing banners.
  // Lemuel Javier (101168735)
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
