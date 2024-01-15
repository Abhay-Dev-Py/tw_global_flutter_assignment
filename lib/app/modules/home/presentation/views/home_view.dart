import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter_getx_template/app/modules/widgets/base_widget.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_appbar_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        addBackButton: false,
        title: Strings.home,
      ),
      body: const Center(
        child: Text("Hello world"),
      ),
    );
  }
}

class HomeProviderView extends StatefulWidget {
  const HomeProviderView({Key? key}) : super(key: key);

  @override
  State<HomeProviderView> createState() => _HomeProviderViewState();
}

class _HomeProviderViewState extends State<HomeProviderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            return Text(value.getData);
          },
        ),
      ),
    );
  }
}
