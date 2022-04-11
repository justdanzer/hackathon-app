// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/logic/article_model.dart';
import 'package:newsapp/views/pages/radio_selected.dart';

import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';

class radio_card extends StatefulWidget {
  final Article article;
  const radio_card({Key? key, required this.article}) : super(key: key);

  @override
  _radio_cardState createState() => _radio_cardState();
}

class _radio_cardState extends State<radio_card> {
  @override
  Widget build(BuildContext context) {
    var article = widget.article;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var themeOf = Theme.of(context);
    final _preferenceController = Get.find<PreferenceController>();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => radio_selected(
              article: article,
            ),
          ),
        );
      },
      child: Container(
        width: 400.0,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 5),
              color: _preferenceController.themeMode.value == "Dark"
                  ? Colors.black
                  : Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            alignment: Alignment.center,
            image: AssetImage(article.image.toString()),
            height: 200.0,
          )
        ]),
      ),
    );
  }
}
