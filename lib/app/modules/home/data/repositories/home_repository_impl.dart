import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/modules/home/data/models/products_model.dart';
import 'package:flutter_getx_template/app/modules/home/data/providers/home_provider.dart';
import 'package:flutter_getx_template/app/modules/home/domain/home_repository_abs.dart';
import 'package:get/get.dart';

class HomeRepositoryImpl extends GetxService with HomeRepositoryAbs {
  // Repository will go to Provider to get the data
  final HomeProvider _homeProvider;

  HomeRepositoryImpl({required HomeProvider homeProvider})
      : _homeProvider = homeProvider;

  @override
  Future<Either<Exception, ProductModel>> loadData() async {
    // take model from service layer and convert here to entity.
    try {
      Either<Exception, ProductModel> v = await _homeProvider.loadData();
      if (v.isRight) {
        return Right(v.right);
      } else {
        return Left(Exception(v.left));
      }
    } on Exception catch (e) {
      return Left(Exception(e));
    }
  }
}
