import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;

class AchievementsPage extends StatefulWidget {
const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}
var achievmentList = [];

man(){
  int count = user.holoCoins; 
        if (count >= 10 && !achievmentList.contains("Reach 10 HoloCoins")) {
        achievmentList.add("Reach 10 HoloCoins");
                 }
        if (count >= 50 && !achievmentList.contains("Reach 50 HoloCoins")) {
        achievmentList.add("Reach 50 HoloCoins");
                 }
        if (count >= 100 && !achievmentList.contains("Reach 100 HoloCoins")) {
        achievmentList.add("Reach 100 HoloCoins");
                 }         
        if (count >= 200 && !achievmentList.contains("Reach 200 HoloCoins")) {
        achievmentList.add("Reach 200 HoloCoins");
                 }
        if (count >= 500 && !achievmentList.contains("Reach 500 HoloCoins")) {
        achievmentList.add("Reach 500 HoloCoins");
                 }
        if (count >= 1000 && !achievmentList.contains("Reach 1000 HoloCoins")) {
        achievmentList.add("Reach 1000 HoloCoins");
                 }
        if (count >= 5000 && !achievmentList.contains("Reach 5000 HoloCoins")) {
        achievmentList.add("Reach 5000 HoloCoins");
                 }
}

class _AchievementsPageState extends State<AchievementsPage> {
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {

                 
    return Scaffold(

        appBar: AppBar(
          
            backgroundColor: Colors.blue,
            title: Text('HoloCoins: ${user.holoCoins}')),
        body: ListView.builder(
            controller: _firstController,
            itemCount: achievmentList.length,
            
            itemBuilder: (BuildContext context, int index) {

              return Container(
                height: 50,
              
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.purple)),
                child: Center(child: Text('Achievement ${achievmentList[index]}')),
              );
            }));
  }
}
