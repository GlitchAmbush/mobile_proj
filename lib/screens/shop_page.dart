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
  final _upgrades = upgrade.upgradeArray;

  void increaseTier(object, tierVal) {
    setState(() {
      object.tier = tierVal + 1;
    });
  }

  void increaseActive(object) {
    if ((object.increase).runtimeType == int) {
      setState(() {
        object.intIncrease(object.increase);
      });
    } else if ((object.increase).runtimeType == double) {
      setState(() {
        object.percentIncrease(object.increase);
      });
    }
  }

  void increasePassive(object) {
    if ((object.increase).runtimeType == int) {
      setState(() {
        object.intIncrease(object.increase);
      });
    } else if ((object.increase).runtimeType == double) {
      setState(() {
        object.percentIncrease(object.increase);
      });
    }
  }

  void checkFuncType(object) {
    if (object.type == "active") {
      increaseActive(object);
    } else {
      increasePassive(object);
    }
  }

  void addToUser(object) {
    setState(() => user.ugprades[object.name] = object.tier);
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
          title: const Text('Shop'),
        ),
        body: ListView.builder(
          controller: _firstController,
          itemCount: _upgrades.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                    "${_upgrades[index].upgradeName} [Tier ${_upgrades[index].upgradeTier}]"),
                subtitle: Text(
                    "${_upgrades[index].upgradeDesc}\nCost: ${_upgrades[index].upgradeCost}"),
                trailing: ElevatedButton(
                    onPressed: checkMax(
                            _upgrades[index].tier, _upgrades[index].maxTier)
                        ? null
                        : () {
                            if (user.holoCoins >= _upgrades[index].cost) {
                              _upgrades[index].purchase();
                              increaseTier(
                                  _upgrades[index], _upgrades[index].tier);
                              checkFuncType(_upgrades[index]);
                              addToUser(_upgrades[index]);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        title: const Text(
                                            'Insufficient HoloCoins!'),
                                        content: const Text(
                                            'You don\'t have enough HoloCoins to purchase an upgrade!'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'))
                                        ],
                                      )));
                            }
                          },
                    child: Text(setButtonState(_upgrades[index].upgradeTier,
                        _upgrades[index].maxTier))),
                isThreeLine: true,
              ),
            );
          },
        ));
  }
}
