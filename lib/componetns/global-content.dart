import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/home/home.dart';
import 'package:ikea/inspirasi/inspirasi.dart';
import 'package:ikea/profile/profile.dart';
import 'package:ikea/wishlist/wishlist.dart';

class Global_content extends StatefulWidget {
  const Global_content({super.key});

  @override
  State<Global_content> createState() => _Global_contentState();
}

class _Global_contentState extends State<Global_content> {
  int _currentIndex = 0;
  Widget _currentScreen = Home();

  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 0) {
        _currentScreen = Home();
      } else if (index == 1) {
        _currentScreen = Inspirasi();
      } else if (index == 2) {
        _currentScreen = Wishlist();
      } else if (index == 3) {
        _currentScreen = Profile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: Color(0xffE7E7E7),
            )
          )
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.string('${Homes}'),
              activeIcon: SvgPicture.string(
                '${Homes}',
                color: const Color(0xff0058AB),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string('${Coffe}'),
              activeIcon: SvgPicture.string(
                '${Coffe}',
                color: const Color(0xff0058AB),
              ),
              label: 'Inspirasi',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string('${Love}'),
              activeIcon: SvgPicture.string(
                '${Love}',
                color: const Color(0xff0058AB),
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.string('${Profiles}'),
              activeIcon: SvgPicture.string(
                '${Profiles}',
                color: const Color(0xff0058AB),
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: const Color(0xff0058AB),
          currentIndex: _currentIndex,
          onTap: _changeSelectedNavBar,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
