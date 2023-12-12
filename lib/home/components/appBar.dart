import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  bool searchVisible = false;
  late ScrollController _controller;

  _scrollListener() {
    if (_controller.offset > 50 ) {
      if (!searchVisible) {
        setState(() {
          searchVisible = true;
        });
      }
    } else {
      if (searchVisible) {
        setState(() {
          searchVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      leadingWidth: 1000,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 84,
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(searchVisible)
              InkWell(
                child: SvgPicture.string('${Search}'),
              ),
              SizedBox(
                width: 24.0,
              ),
              InkWell(
                child: SvgPicture.string('${Bell}'),
              ),
              SizedBox(
                width: 24.0,
              ),
              InkWell(
                child: SvgPicture.string('${Cart}'),
              )
            ],
          ),
        )
      ],
    );
  }
}
