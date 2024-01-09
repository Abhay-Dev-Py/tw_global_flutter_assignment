import 'package:flutter_getx_template/app/modules/home/data/providers/home_provider.dart';
import 'package:flutter_getx_template/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_getx_template/app/modules/home/data/services/home_service.dart';
import 'package:flutter_getx_template/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeService>(
      HomeService(apiHelper: Get.find()),
    );

    Get.put<HomeProvider>(
      HomeProvider(homeService: Get.find()),
    );

    Get.put<HomeRepositoryImpl>(
      HomeRepositoryImpl(homeProvider: Get.find()),
    );

    Get.put<HomeController>(
      HomeController(
        homeRepository: Get.find(),
      ),
    );
  }
}
