import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;
import 'dart:math';

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
            centerTitle: true,
            title: Text(
              'HoloCoins: ${user.holoCoins}',
            )),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              int random = Random().nextInt(max(1, 1000));
              int random2 = Random().nextInt(max(1, 15));
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(100)),
                    onPressed: () {
                      setState(() {
                        if (user.holoCoins < index + 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Not enough HoloCoins')));
                        } else {
                          user.holoCoins -= random2;
                          user.holoCoins += random;
                        }
                      });
                    },
                    child:
                        Text('Get $random HoloCoins for $random2 HoloCoins')),
              );
            }));
  }
}
