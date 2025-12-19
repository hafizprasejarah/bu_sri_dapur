import 'package:get/get.dart';

import '../controllers/re_order_controller.dart';

class ReOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReOrderController>(
      () => ReOrderController(),
    );
  }
}
