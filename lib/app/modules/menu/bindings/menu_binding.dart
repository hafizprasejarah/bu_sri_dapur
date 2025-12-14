import 'package:get/get.dart';

import '../controllers/menu_page_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuPageController >(
      () => MenuPageController (),
    );

  }
}
