import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('HoloCoins: ${user.holoCoins}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(100)),
                    onPressed: () {},
                    child: Text('Upgrade $index \nIncrease Money :D')),
              );
            }));
  }
}
