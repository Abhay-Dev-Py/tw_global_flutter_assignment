import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/common/values/api_strings.dart';
import 'package:flutter_getx_template/app/data/api_helper_impl.dart';
import 'package:get/get.dart';

class HomeService extends GetxService {
  // make api calls from network layer here
  final ApiHelperImpl _apiHelper;

  HomeService({required ApiHelperImpl apiHelper}) : _apiHelper = apiHelper;

  Future<Either<Exception, Response>> loadData() async {
    Either<Exception, Response<dynamic>> v =
        await _apiHelper.getRequest(ApiRoutes.products);
    if (v.isRight) {
      return Right(v.right);
    } else {
      return Left(Exception(v.left));
    }
  }
}
