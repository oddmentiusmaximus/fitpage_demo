import 'package:get/get.dart';

import '../controller/home_controller.dart';

class StockScanHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockScanHomeController());
  }
}
