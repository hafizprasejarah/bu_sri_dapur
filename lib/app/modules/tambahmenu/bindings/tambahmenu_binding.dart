import 'package:get/get.dart';

import '../controllers/tambahmenu_controller.dart';

class TambahmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahmenuController>(
      () => TambahmenuController(),
    );
  }
}
