// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';
import 'package:newsapp/views/utils/checkbox_list.dart';

class for_you_tab extends StatefulWidget {
  const for_you_tab({Key? key}) : super(key: key);

  @override
  _for_you_tabState createState() => _for_you_tabState();
}

class _for_you_tabState extends State<for_you_tab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var themeOf = Theme.of(context);

    final _funController = Get.find<FunctionalityController>();
    final _preferenceController = Get.find<PreferenceController>();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: width,
                  color: Colors.amber,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Get caught up. News curated just for you:",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text("You've been caught up for 83 days."),
                  padding: EdgeInsets.all(20.0),
                  color: Colors.green,
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: height,
                  child: Container(child: CheckBoxListTileDemo()),
                ))
              ],
            )
          ],
        ));
  }
}
