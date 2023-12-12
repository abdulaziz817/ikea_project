import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

Widget Desc(String desc, String harga, String sold, String detail) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 12.0,
      ),
      Text(
        desc,
        style: graynormal16,
      ),
      const SizedBox(
        height: 12.0,
      ),
      Text(
        harga,
        style: blackbold24,
      ),
      const SizedBox(
        height: 11.0,
      ),
      Row(
        children: [
          Row(
            children: [
              SvgPicture.string('${Star}'),
              SvgPicture.string('${Star}'),
              SvgPicture.string('${Star}'),
              SvgPicture.string('${Star}'),
              SvgPicture.string('${Star}')
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            sold,
            style: graynormal,
          )
        ],
      ),
      const SizedBox(
        height: 24.0,
      ),
      Text(
        detail,
        style: blacknormal16,
      )
    ],
  );
}
