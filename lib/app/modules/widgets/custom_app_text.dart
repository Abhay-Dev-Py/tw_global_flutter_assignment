import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTitle extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  const ViewTitle({Key? key, required this.title, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.left,
      style: GoogleFonts.manrope(
        color: AppColors.indigo,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  const Heading({Key? key, required this.title, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.manrope(
        color: AppColors.indigo,
        fontSize: 21,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

//text below heading
class Subheading extends StatelessWidget {
  final String title;
  const Subheading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: GoogleFonts.manrope(
        color: AppColors.indigo,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;

  const MyText({
    Key? key,
    required this.title,
    required this.color,
    this.size,
    this.textAlign,
    this.fontWeight,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      style: GoogleFonts.manrope(
        color: color,
        fontSize: size ?? 16,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MyTextWithEllipsis extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;

  const MyTextWithEllipsis({
    Key? key,
    required this.title,
    required this.color,
    this.size,
    this.textAlign,
    this.fontWeight,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.manrope(
        color: color,
        fontSize: size ?? 16,
        fontWeight: fontWeight,
      ),
    );
  }
}

class StringUtil {
  static String? toTitleCase(String? text) {
    if (text == null || text.isEmpty) {
      return text;
    }

    List<String> words = text.split(' ');

    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    String result = words.join(' ');

    return result;
  }
}

Widget detailHeading(
  String heading, {
  bool isEditRequired = false,
  Function? edit,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: MyText(
          title: heading,
          color: AppColors.indigo,
          size: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (edit != null)
        GestureDetector(
          onTap: () => edit(),
          child: MyText(
            title: isEditRequired ? 'edit' : 'save',
            color: AppColors.blue,
            size: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
    ],
  );
}
