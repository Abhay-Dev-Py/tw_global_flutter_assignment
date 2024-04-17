import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchView extends GetView<SearchPhotoController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('TW Global'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search for images',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  controller: controller.searchTextController.value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.redirectToDashboard();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: const Text('Explore!'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
