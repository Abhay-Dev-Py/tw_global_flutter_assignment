import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:flutter_getx_template/app/common/values/api_strings.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/modules/home/data/models/products_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<ProductModel?> productData = null.obs;
  RxBool isLoading = false.obs;
  final ApiHelperImpl _apiHelper = Get.find();

  onButtonPressed() async {
    isLoading.value = true;
    try {
      Either<Exception, Response<dynamic>> rawData =
          await _apiHelper.getRequest(ApiRoutes.products);
      if (rawData.isRight) {
        productData.value = ProductModel.fromJson(rawData.right.body);
      } else {
        productData.value = null;
        Utils.showSnackbar("Exception ${rawData.left.toString()}");
      }
    } catch (e) {
      productData.value = null;
      Utils.showSnackbar("Exception ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
