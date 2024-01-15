import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepositoryImpl _homeRepository;

  HomeController({required HomeRepositoryImpl homeRepository})
      : _homeRepository = homeRepository;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  Future<void> initialize() async {
    try {
      Either data = await _homeRepository.loadData();
      if (data.isLeft) {
        printError(info: data.left.toString());
      } else {
        printInfo(info: "--> Perfect!");
      }
    } on Exception catch (e) {
      printError(info: "--> Errors $e");
    }
  }
}

class HomeProvider extends ChangeNotifier {
  String data = "Here's my data";

  String get getData => data;
  set setData(value) {
    data = value;
    notifyListeners();
  }

  
}
