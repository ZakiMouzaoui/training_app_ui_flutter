import 'package:get/get.dart';
import 'package:trqining_app/controllers/detail_controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => (DetailController));
    // TODO: implement dependencies
  }
}