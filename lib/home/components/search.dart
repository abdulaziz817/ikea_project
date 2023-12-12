import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';

class Searching extends StatefulWidget {
  final void Function(String query) onChanged;

  const Searching({required this.onChanged});

  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> with SingleTickerProviderStateMixin {
  bool _isClicked = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
          if (_isClicked) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_animation.value),
        child: TextField(
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Cari barang impianmu',
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.string(
                '${Search}',
                width: 24,
                height: 24,
              ),
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: primarygrey,
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
