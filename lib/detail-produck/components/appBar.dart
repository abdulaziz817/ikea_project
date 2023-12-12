import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class AppbarDetail extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDetail({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black12,
        width: 0.5,
      ))),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ALEX/LAGKAPTEN',
            style: blackbold18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
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
                  child: SvgPicture.string('${Share}'),
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
