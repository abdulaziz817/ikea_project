import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';

Widget Koleksi(dynamic color, String img, String title, String desc) {
  return  Column(
      children: [
        Container(
          width: 183,
          height: 232,
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                img,
                width: 183,
                fit: BoxFit.cover,
                height: 119,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 13, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: whitebold16,
                    ),
                    SizedBox(height: 6,),
                    Text(
                      desc,
                      style: whitenormal14,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
}
