import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';


Widget GridCol(String img, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(img, width: 183, height: 120,),
      SizedBox(height: 16.0,),
      Text(title, style: blackbold16,)
    ],
  );
}

Widget GridRow(String img, String title,  BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(img, width: MediaQuery.of(context).size.width, height: 120,),
      SizedBox(height: 16.0,),
      Text(title, style: blackbold16,)
    ],
  );
}