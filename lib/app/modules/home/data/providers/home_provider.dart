import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/modules/home/data/models/products_model.dart';
import 'package:flutter_getx_template/app/modules/home/data/services/home_service.dart';
import 'package:get/get.dart';

class HomeProvider extends GetxService {
  final HomeService _homeService;
  HomeProvider({required HomeService homeService}) : _homeService = homeService;

  // Provider layer check from where to get the data from , either local or network
  bool isNetworkConnected = true;

  Future<Either<Exception, ProductModel>> loadData() async {
    try {
      if (isNetworkConnected) {
        // go to network layer

        Either<Exception, Response<dynamic>> rawData =
            await _homeService.loadData();
        if (rawData.isRight) {
          // convert rawData to model

          ProductModel _productModel =
              ProductModel.fromJson(rawData.right.body);
          return Right(_productModel);
        } else {
          return Left(Exception(rawData.left));
        }
      } else {
        // either throw error or provide data from local storage
        return Left(Exception("No Internet connection"));
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
