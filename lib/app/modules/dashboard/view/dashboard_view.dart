import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_getx_template/app/modules/dashboard/models/response_model.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: 'searchText',
              child: Text(controller.query.value),
            ),
          ),
          body: controller.model == null
              ? const SizedBox()
              : GalleryGrid(images: controller.model!.hits!),
        ),
      ),
    );
  }
}

class GalleryGrid extends StatelessWidget {
  final List<Hits> images;

  const GalleryGrid({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return images.isEmpty
        ? const Center(
            child: Text(
              "No images found!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          )
        : GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  2, // Number of columns depending on the screen width
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    FullScreenImagePage(
                      imageUrl:
                          images[index].previewURL ?? Constants.dummyImageUrl,
                    ),
                  );
                },
                child: GridTile(
                  child: Image.network(
                    images[index].previewURL ?? Constants.dummyImageUrl,
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(
                      'Likes: ${images[index].likes}',
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Views: ${images[index].views}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
