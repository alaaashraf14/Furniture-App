import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../../resources/style/app_colors.dart';


class PublicDivider extends StatelessWidget {
  const PublicDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.5),
            color: Colors.black26),
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
