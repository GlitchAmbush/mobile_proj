import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: const Text('Achievements'),
        ),
        body: ListView.builder(
            controller: _firstController,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.purple)),
                child: Center(child: Text('Achievement $index \nlorum ipsum')),
              );
            }));
  }
}
