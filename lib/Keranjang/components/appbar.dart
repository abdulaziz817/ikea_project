import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class AppbarKeranjang extends StatefulWidget implements PreferredSizeWidget {
  const AppbarKeranjang({Key? key}) : super(key: key);

  @override
  State<AppbarKeranjang> createState() => _AppbarKeranjangState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarKeranjangState extends State<AppbarKeranjang> {
  bool SecurePass = true;

  void _SecurePass() {
    setState(() {
      SecurePass = !SecurePass;
    });
  }

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
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Keranjang",
                style: blackbold18,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: _SecurePass,
              child: SecurePass
                  ? SvgPicture.string(
                      '${Love}',
                    )
                  : SvgPicture.string('${Loved}'),
            ),
          )
        ],
      ),
    );
  }
}
