import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/animation.dart';
import 'package:ikea/inspirasi/components/appBar.dart';
import 'package:ikea/inspirasi/components/grid.dart';

class Inspirasi extends StatefulWidget {
  const Inspirasi({Key? key}) : super(key: key);

  @override
  State<Inspirasi> createState() => _InspirasiState();
}

class _InspirasiState extends State<Inspirasi> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  Widget Option(
    int Index,
    String Title,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = Index;
        });
      },
      child: Container(
        width: 127,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Index == selectedIndex ? Colors.transparent : Color(0xffE7E7E7),
          ),
          color: Index == selectedIndex ? Color(0xff0058AB) : Colors.transparent,
        ),
        child: Center(
          child: Text(
            Title,
            style: TextStyle(
              color: Index == selectedIndex ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridRow(String imagePath, String description, BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: GridRow(imagePath, description, context),
    );
  }

  Widget buildGridCol(String imagePath, String description) {
    return FadeTransition(
      opacity: _animation,
      child: GridCol(imagePath, description),
    );
  }

  Widget buildHorizontalOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 12,
        children: [
          Option(0, 'Semua'),
          Option(1, 'Ruang Kerja'),
          Option(2, 'Dapur'),
          Option(3, 'Ruang Keluarga'),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarInspirasi(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 23.0,
              ),
              Column(
                children: [
                  buildHorizontalOptions(),
                  SizedBox(
                    height: 24.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Row(
                          children: [
                            buildGridCol('images/setup.png', 'Hunian compact yang\nnyaman'),
                            SizedBox(
                              width: 16.0,
                            ),
                            buildGridCol(
                              'images/sport.png',
                              'Lakukan 5 hal ini\nagar sepatumu bebas ...',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  buildGridRow(
                    'images/bigbed.png',
                    'Hadirkan nuasa elegant dan fancy\nkedalam kamar tidur anda',
                    context,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Row(
                          children: [
                            buildGridCol(
                              'images/soap.png',
                              'Rumah lebih sehat\ndengan set tempat ...',
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            buildGridCol(
                              'images/toy.png',
                              'Membuat kamar anak\nrapi jadi lebih mudah',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
