import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:flutter_getx_template/app/modules/dashboard/models/response_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool inAsyncCall = false.obs;
  final ApiHelperImpl _networkService = ApiHelperImpl();
  ResponseModel? model;
  RxString query = "".obs;

  @override
  void onInit() {
    query.value = Get.arguments as String;
    _loadData();
    super.onInit();
  }

  Future<void> _loadData() async {
    if (query.isNotEmpty) {
      try {
        inAsyncCall.value = true;
        Either<Exception, Response<dynamic>> result =
            await _networkService.getRequest(
          Constants.baseUrl,
          query: {
            'key': Constants.apiKey,
            'q': query.value,
            'image_type': 'photo',
            'pretty': "true",
          },
        ).whenComplete(
          () => inAsyncCall.value = false,
        );

        if (result.isRight) {
          Map<String, dynamic> rawResult = result.right.body;
          model = ResponseModel.fromJson(rawResult);
        }
      } on Exception catch (_) {
        inAsyncCall.value = false;
      }
    }
  }
}
