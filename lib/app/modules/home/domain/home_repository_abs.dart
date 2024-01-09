import 'package:either_dart/either.dart';
import 'package:flutter_getx_template/app/modules/home/data/models/products_model.dart';

abstract class HomeRepositoryAbs
{
  Future<Either<Exception, ProductModel>> loadData();
}