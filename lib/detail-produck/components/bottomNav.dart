import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/Keranjang/keranjang.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class BottomDetail extends StatefulWidget {
  const BottomDetail({super.key});

  @override
  State<BottomDetail> createState() => _BottomDetailState();
}

class _BottomDetailState extends State<BottomDetail> {
  int index_add = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 104,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: Colors.black12,
          width: 1,
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: primarygrey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (index_add > 0) {
                        setState(() {
                          index_add = index_add - 1;
                        });
                      }
                    },
                    child: SvgPicture.string('${Minus}'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(index_add.toString()),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (index_add > -1) {
                        setState(() {
                          index_add = index_add + 1;
                        });
                      }
                    },
                    child: SvgPicture.string('${Plus}'),
                  ),
                ],
              ),
            ),
            Container(
              width: 230,
              height: 56,
              color: primary,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Keranjang()));
                },
                child: Text(
                  'Tambah ke Keranjang',
                  style: whitebold16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
