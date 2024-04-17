import 'package:flutter_getx_template/app/modules/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchPhotoController>(SearchPhotoController());
  }
}
