// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/logic/article_model.dart';
import 'package:newsapp/views/utils/radio_card.dart';
import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';
import 'package:newsapp/views/utils/checkbox_list.dart';

class radio_selected extends StatelessWidget {
  const radio_selected({Key? key, required this.article}) : super(key: key);

  final Article article;

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
            SizedBox(
              height: 300.0,
              child: radio_card(article: article),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("TODO: add play bar here"),
            ),
            SizedBox(height: 25.0),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "This is some sample text about the content of the show, etc."),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 100.0,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => {}, child: Text("Call in")),
                  ElevatedButton(onPressed: () => {}, child: Text("Message"))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("More from " + article.author.toString()),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 100.0,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text("Support " + article.author.toString())),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Hear what others are saying "),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("More on this topic "),
            ),
          ],
        ));
  }
}
