import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}
//this checks if achievements meet requirements to be added and show up as an actual achievment earned
//Ronal Rodriguez Arias (101314540)
setAchievements() {
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
  if(user.collection.isNotEmpty && !user.achievements.contains("Reach First Idol")){
    user.achievements.add("Reach First Idol");
  }
}

//this just displayed all the earned achievements and displays them on screen
//which also has styling to make it look better
//Ronal Rodriguez Arias
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
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Achievement: ${user.achievements[index]}',
                    style: TextStyle(
                      fontSize: 16,
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
