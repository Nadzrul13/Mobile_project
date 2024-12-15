import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/categories_page/controllers/deep_cleaning_controller.dart';

class DeepCleaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeepCleaningController>(() => DeepCleaningController());
  }
}
