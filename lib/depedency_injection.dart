import 'package:klinik_shoes_project/module/connectivity/binding/connectivity_binding.dart';

class DependencyInjection {
  
  static void init() {
    ConnectivityBinding().dependencies();
  }
}