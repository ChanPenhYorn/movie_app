import 'package:flutflix/constants/style_color.dart';
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: StyleColor.scaffoldBgColor,
          borderRadius: BorderRadius.circular(8)),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          )),
    );
  }
}
