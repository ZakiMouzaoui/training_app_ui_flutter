import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var icons = [];

  @override
  void onInit() {
    getIcons();
    super.onInit();
  }

  void getIcons() async {
    final data = await readJson();
    icons = data["icons"];
    update();

  }

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/data/home_icons.json');
    final data = jsonDecode(response);
    return data;
  }
}
