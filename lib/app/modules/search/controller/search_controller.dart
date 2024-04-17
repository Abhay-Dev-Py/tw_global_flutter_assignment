import 'package:flutter/widgets.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchPhotoController extends GetxController {
  final Rx<TextEditingController> searchTextController =
      TextEditingController().obs;

  void redirectToDashboard() =>
      Get.toNamed(Routes.DASHBOARD, arguments: searchTextController.value.text);
}
