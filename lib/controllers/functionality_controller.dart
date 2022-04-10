// ignore_for_file: prefer_const_declarations, avoid_print, unused_local_variable

import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/logic/article_model.dart';

class FunctionalityController extends GetxController {
  // News sections///////////////////
  var topHeadlines = [].obs;
  var businessHeadlines = [].obs;
  var financeHeadLines = [].obs;
  var sportHeadlines = [].obs;
  var techHeadlines = [].obs;
  var entertaintHeadlines = [].obs;
  var healthHeadlines = [].obs;
  var scienceHeadlines = [].obs;
  var radioStations = [].obs;
  var localHeadlines = [].obs;

  var isLoading = false.obs;

  var isLoadingHeadlines = false;

  var searchResults = [].obs;

  @override
  void onInit() {
    loadNews();
    super.onInit();

    loadRadio();
    super.onInit();

    loadLocalNews();
    super.onInit();
  }

  String constructUrl(String category) {
    return category == "topHeadlines"
        ? "https://newsapi.org/v2/top-headlines?country=us&apiKey=0d09928cab5c4623bd3a1de740dd2a67"
        : "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=0d09928cab5c4623bd3a1de740dd2a67";
  }

  loadLatestNews(String category) async {
    // isLoading(true);
    var response = await http.get(Uri.parse(constructUrl(category)));
    if (response.statusCode == 200) {
      var map = json.decode(response.body);
      var news = News.fromJson(map);

      switch (category) {
        case "topHeadlines":
          topHeadlines.assignAll(news.articles!);
          break;
        case "business":
          businessHeadlines.assignAll(news.articles!);
          break;
        case "sports":
          sportHeadlines.assignAll(news.articles!);
          break;
        case "technology":
          techHeadlines.assignAll(news.articles!);
          break;
        case "health":
          healthHeadlines.assignAll(news.articles!);
          break;
        case "entertainment":
          entertaintHeadlines.assignAll(news.articles!);
          break;

        case "science":
          scienceHeadlines.assignAll(news.articles!);
          break;
      }

      // isLoading(false);
    }
  }

  Future loadNews() async {
    loadLatestNews("topHeadlines");
    loadLatestNews("business");
    loadLatestNews("sports");
    loadLatestNews("technology");
    loadLatestNews("health");
    loadLatestNews("entertainment");
    loadLatestNews("science");
  }

//Radio section
  var defaultCity = "Cambridge".obs;

  loadRadio() async {
    String data = await rootBundle.loadString('assets/radio/small_radio.json');
    var radioData = await json.decode(data);
    var radios = Radio.fromJson(radioData);
    radioStations.assignAll(radios.radioStations!);
  }

  loadLocalNews() async {
    String data = await rootBundle.loadString('assets/news/local_news.json');
    var localNewsData = await json.decode(data);
    var localnews = News.fromJson(localNewsData);
    localHeadlines.assignAll(localnews.articles!);
  }
}
