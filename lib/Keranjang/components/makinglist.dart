import 'package:flutter/material.dart';
import 'package:ikea/theme/color.dart';
import 'package:intl/intl.dart';

Widget Makinglist(BuildContext context, dynamic harga, String images, String title, String desc,) {
  return  Column(
    children: [
      Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:  DecorationImage(
                      image: AssetImage(images))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: blackbold16,),
                    SizedBox(height: 6,),
                    Text(desc, style: graynormal,),
                  ],
                ),
                Text(
                    '${formatRupiah(harga)}', style: blackbold16,)
              ],
            ),
          ],
        ),
      ),
    ],
  );
}


String formatRupiah(int harga) {
  final currencyFormat =
  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
  return currencyFormat.format(harga);
}

