import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: checkBoxListTileModel.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  CheckboxListTile(
                      activeColor: Colors.pink[300],
                      dense: true,
                      //font change
                      title: Text(
                        checkBoxListTileModel[index].title.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      value: checkBoxListTileModel[index].isCheck,
                      onChanged: (bool? val) {
                        itemChange(val, index);
                      })
                ])));
      },
    );
  }

  void itemChange(bool? val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}

class CheckBoxListTileModel {
  int? userId;
  String? img;
  String? title;
  bool? isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/images/android_img.png',
          title: "Your Local News Briefing",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/images/flutter.jpeg',
          title: "Your Global News Briefing",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/images/ios_img.webp',
          title: "Recommended for you: A 5 minute history of BBQ",
          isCheck: false),
    ];
  }
}
