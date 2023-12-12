// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class AppbarInspirasi extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  const AppbarInspirasi({Key? key, this.height = 100.0}) : super(key: key);

  @override
  _AppbarInspirasiState createState() => _AppbarInspirasiState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppbarInspirasiState extends State<AppbarInspirasi> {
  int selectedIndex = 0;

  Widget option(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: index == selectedIndex
                    ? Color(0xff0058AB)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    index == selectedIndex ? FontWeight.w500 : FontWeight.w400,
                color:
                    index == selectedIndex ? Colors.black : Color(0xff6C6C6C),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(widget.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: primarygrey,
              width: 1,
            )
        )
      ),
      child: AppBar(
        elevation: 0,
        toolbarHeight: widget.height,
        backgroundColor: Colors.transparent,
        leadingWidth: 1000,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.0,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Temukan Inspirasi',
                  style: blackbold18,
                ),
              ),
              Row(
                children: [
                  option(0, 'Inspirasi'),
                  SizedBox(width: 30),
                  option(1, 'Koleksi'),
                  SizedBox(width: 30),
                  option(2, 'Edukasi'),
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0, bottom: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: SvgPicture.string('${Search}'),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                InkWell(
                  child: SvgPicture.string('${Cart}'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
