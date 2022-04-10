// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/views/utils/reusable_constents.dart';
import 'package:newsapp/views/utils/reusable_widgets.dart';

class radio_tab extends StatefulWidget {
  const radio_tab({Key? key}) : super(key: key);

  @override
  _radio_tabState createState() => _radio_tabState();
}

class _radio_tabState extends State<radio_tab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          gap1(height),
          Expanded(
            child: Container(
              width: width,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 47,
                  title: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    labelStyle: themeOf.textTheme.headline2,
                    labelColor: _preferenceController.themeMode.value == "Dark"
                        ? Colors.white
                        : Colors.black,
                    isScrollable: true,
                    indicatorColor: themeOf.primaryColor,
                    tabs: [
                      Tab(
                        text: "Your Stations",
                      ),
                      Tab(
                        text: "What Others Are Saying",
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    getRadioTab(context, _funController.radioStations),
                    getRadioTab(context, _funController.radioStations)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
