import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;
import '../util/upgrade_data.dart' as upgrade;

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ScrollController _firstController = ScrollController();

  void increaseTier(tier) {
    setState(() {
      tier++;
    });
  }

  bool checkMax(tier, max) {
    if (tier == max) {
      return true;
    }
    return false;
  }

  String setButtonState(tier, max) {
    if (tier == max) {
      return "Maxed";
    }

    if (tier != 0) {
      return "Upgrade";
    }

    return "Buy";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'HoloCoins: ${user.holoCoins}',
            )),
        body: ListView(children: [
          Card(
            child: ListTile(
              title: Text(
                  "${upgrade.channel.name} [Tier ${upgrade.channel.tier}]"),
              subtitle: Text(upgrade.channel.desc),
              trailing: ElevatedButton(
                  onPressed: () {
                    increaseTier(upgrade.channel.tier);
                  },
                  child: Text(setButtonState(upgrade.channel.tier, 3))),
              isThreeLine: true,
            ),
          )
        ]));
  }
}
