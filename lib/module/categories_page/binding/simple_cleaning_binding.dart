import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/categories_page/controllers/simple_cleaning_controller.dart';

class SimpleCleaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimpleCleaningController>(() => SimpleCleaningController());
  }
}
