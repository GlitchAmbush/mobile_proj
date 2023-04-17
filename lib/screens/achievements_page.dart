import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

setAchievments() {
  int count = user.holoCoins;
  if (count >= 10 && !user.achievements.contains("Reach 10 HoloCoins")) {
    user.achievements.add("Reach 10 HoloCoins");
  }
  if (count >= 50 && !user.achievements.contains("Reach 50 HoloCoins")) {
    user.achievements.add("Reach 50 HoloCoins");
  }
  if (count >= 100 && !user.achievements.contains("Reach 100 HoloCoins")) {
    user.achievements.add("Reach 100 HoloCoins");
  }
  if (count >= 200 && !user.achievements.contains("Reach 200 HoloCoins")) {
    user.achievements.add("Reach 200 HoloCoins");
  }
  if (count >= 500 && !user.achievements.contains("Reach 500 HoloCoins")) {
    user.achievements.add("Reach 500 HoloCoins");
  }
  if (count >= 1000 && !user.achievements.contains("Reach 1000 HoloCoins")) {
    user.achievements.add("Reach 1000 HoloCoins");
  }
  if (count >= 5000 && !user.achievements.contains("Reach 5000 HoloCoins")) {
    user.achievements.add("Reach 5000 HoloCoins");
  }
}

class _AchievementsPageState extends State<AchievementsPage> {
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Achievement'),
      ),
      body: ListView.builder(
        controller: _firstController,
        itemCount: user.achievements.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Achievement: ${user.achievements[index]}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
