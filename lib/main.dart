import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trqining_app/pages/home_page.dart';
void main(){
  runApp(const TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: "/",
      //initialBinding: MyBinding(),

    );
  }
}
