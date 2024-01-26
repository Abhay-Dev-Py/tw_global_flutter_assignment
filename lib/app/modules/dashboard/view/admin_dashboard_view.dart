import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_scaffold_widget.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Center(
        child: Text("Coming soon"),
      ),
    );
  }
}