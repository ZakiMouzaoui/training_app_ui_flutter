import 'package:get/get.dart';
import 'package:trqining_app/controllers/home_controller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => (HomeController));
    // TODO: implement dependencies
  }
}