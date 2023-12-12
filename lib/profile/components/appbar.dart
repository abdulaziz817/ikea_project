import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class AppbarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppbarProfile({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      leadingWidth: 1000,
      leading: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              "Menu Akun",
              style: blackbold18,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.string('${Setting}'),
          ),
        )
      ],
    );
  }
}
