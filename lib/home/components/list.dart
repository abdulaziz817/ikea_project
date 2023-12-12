import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';

Widget Populer(String img, String title, String detail, String price) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(img, width: 146,),
        SizedBox(height: 12,),
        Text(title, style: blackbold16,),
        SizedBox(height: 6,),
        Text(detail, style: graynormal,),
        SizedBox(height: 12,),
        Text(price,style: blackbold16,)
      ],
    );
}
