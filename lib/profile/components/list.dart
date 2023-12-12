import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ikea/theme/color.dart';

Widget ListProfile(String svg, String title) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
              color: Color(0xffE7E7E7),
              width: 1,
            ),
            bottom: BorderSide(
              color: Color(0xffE7E7E7),
              width: 1,
            ))),
    height: 74.0,
    child: Row(
      children: [
        SvgPicture.string(svg),
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: blackbold16,
        )
      ],
    ),
  );
}
