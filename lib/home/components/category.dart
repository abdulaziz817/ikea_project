import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';

Widget Category(String img, String title ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(img, width: 110,),
      SizedBox(height: 10,),
      Text(title, style: blackbold,)
    ],
  );
}
