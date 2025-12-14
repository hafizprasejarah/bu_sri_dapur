import 'package:get/get.dart';

import '../controllers/editmenu_controller.dart';

class EditmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditmenuController>(
      () => EditmenuController(),
    );
  }
}
