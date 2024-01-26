import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/widgets/custom_app_text.dart';

// Widget to use the country picker ui for sigin and signup
class CountryPickerUI extends StatelessWidget {
  const CountryPickerUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: MyText(
                  color: AppColors.hintInfotextColor,
                  title: "Country",
                  fontWeight: FontWeight.w400,
                  size: 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.pngs.commonIndianFlag,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 5),
                  const MyText(
                    color: AppColors.indigo,
                    title: "+91",
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
