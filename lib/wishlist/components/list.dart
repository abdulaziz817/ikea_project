import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';

class ListWishtlist extends StatelessWidget {
  final String images;
  final String title;
  final String desc;
  final String harga;

  const ListWishtlist(
      {super.key,
      required this.images,
      required this.title,
      required this.desc,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            images,
            width: 99,
          ),
          Column(
            children: [
              Text(
                title,
                style: blackbold16,
              ),

              Text(
                desc,
                style: graynormal,
              ),
              Text(
                harga,
                style: blackbold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
