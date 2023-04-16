import 'package:flutter/material.dart';
import '../util/user_data.dart' as user;
import '../util/banner_data.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16.0),
        itemCount: bannerTitle.length,
        itemBuilder: (BuildContext context, int index) {
          String genName = bannerTitle.keys.toList()[index];
          Map<String, double>? genMembers =
              bannerTitle.values.toList()[index].cast<String, double>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 8.0),
                child: Center(
                  child: Text(
                    genName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: genMembers.length,
                  itemBuilder: (BuildContext context, int index) {
                    String memberName = genMembers.keys.toList()[index];
                    bool isSelected = user.collection.contains(memberName);
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey[400]!,
                        ),
                        color: Colors.grey[100],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListTile(
                        title: Text(
                          memberName,
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey[800],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
