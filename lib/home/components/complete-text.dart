import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';


Widget Sub( String title, String link) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(title, style: blackbold18,),
      Text(link, style: linknormal,),
    ],
  );
}