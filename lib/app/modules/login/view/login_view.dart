import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/login/controller/login_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_text_button.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        child: Scaffold(
          body: controller.productData.value == null
              ? Center(
                  child: CustomTextButton(
                    buttonWidth: 185.w,
                    height: 45,
                    onPressed: controller.onButtonPressed,
                    title: "Populate Data",
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount:
                          controller.productData.value!.products?.length ?? 0,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(
                            controller.productData.value!.products?[index]
                                    .brand ??
                                "",
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
