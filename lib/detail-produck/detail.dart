// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ikea/custom/svg.dart';
// import 'package:ikea/detail-produck/components/ImageList.dart';
// import 'package:ikea/detail-produck/components/appBar.dart';
// import 'package:ikea/detail-produck/components/bottomNav.dart';
// import 'package:ikea/detail-produck/components/deskripsi.dart';
// import 'package:ikea/theme/color.dart';

// class DetailProduck extends StatefulWidget {
//   const DetailProduck({Key? key});

//   @override
//   _DetailProduckState createState() => _DetailProduckState();
// }

// class _DetailProduckState extends State<DetailProduck>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _loveIconScaleAnimation;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   bool _isLoved = false;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );

//     _loveIconScaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     // Start the animation after a delay
//     Future.delayed(Duration(milliseconds: 500), () {
//       _animationController.forward();
//     });
//   }

//   void _toggleLoveIcon() {
//     setState(() {
//       _isLoved = !_isLoved;
//     });

//     if (_isLoved) {
//       _animationController.forward();
//     } else {
//       _animationController.reverse();
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppbarDetail(),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Hero animation for the image
//                   Hero(
//                     tag: 'productImage',
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: Image.asset(
//                         'images/room.png',
//                         width: MediaQuery.of(context).size.width,
//                         height: 370,
//                       ),
//                     ),
//                   ),
//                   Wrap(
//                     spacing: 15,
//                     children: [
//                       // Scale animation for the images in the Wrap
//                       ScaleTransition(
//                         scale: _scaleAnimation,
//                         child: ImageList('images/tabledesk.png'),
//                       ),
//                       ScaleTransition(
//                         scale: _scaleAnimation,
//                         child: ImageList('images/dek.png'),
//                       ),
//                       ScaleTransition(
//                         scale: _scaleAnimation,
//                         child: ImageList('images/tiang.png'),
//                       ),
//                       ScaleTransition(
//                         scale: _scaleAnimation,
//                         child: ImageList('images/room.png'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 24.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Fade animation for the product name
//                       FadeTransition(
//                         opacity: _fadeAnimation,
//                         child: Text(
//                           'ALEX/LAGKAPTEN',
//                           style: blackbold20,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _toggleLoveIcon();
//                         },
//                         child: AnimatedBuilder(
//                           animation: _animationController,
//                           builder: (context, child) {
//                             return Transform.scale(
//                               scale: _loveIconScaleAnimation.value,
//                               child: _isLoved
//                                   ? SvgPicture.string(
//                                       '${Loved}',
//                                     )
//                                   : SvgPicture.string('${Love}'),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Fade animation for the product description
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: Desc(
//                       'Meja, hijau muda/putih, 120x60 cm',
//                       'Rp1.909.000',
//                       '4.5 | Terjual 116',
//                       'Ruang terbatas bukan berarti Anda harus menolak belajar atau bekerja dari rumah. Meja ini memakan sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.',
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomDetail(),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/detail-produck/components/ImageList.dart';
import 'package:ikea/detail-produck/components/appBar.dart';
import 'package:ikea/detail-produck/components/bottomNav.dart';
import 'package:ikea/detail-produck/components/deskripsi.dart';
import 'package:ikea/theme/color.dart';

class DetailProduck extends StatefulWidget {
  const DetailProduck({Key? key});

  @override
  _DetailProduckState createState() => _DetailProduckState();
}

class _DetailProduckState extends State<DetailProduck>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _loveIconScaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  bool _isLoved = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _loveIconScaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation after a delay
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.forward();
    });
  }

  void _toggleLoveIcon() {
    setState(() {
      _isLoved = !_isLoved;
    });

    if (_isLoved) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarDetail(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero animation for the image
                  Hero(
                    tag: 'productImage',
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Image.asset(
                        'images/room.png',
                        width: MediaQuery.of(context).size.width,
                        height: 370,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  // Wrap for the images
                  Wrap(
                    spacing: 15,
                    children: [
                      // Scale animation for the images in the Wrap
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: ImageList('images/tabledesk.png'),
                      ),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: ImageList('images/dek.png'),
                      ),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: ImageList('images/tiang.png'),
                      ),
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: ImageList('images/room.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // Product Information
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Fade animation for the product name
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'ALEX/LAGKAPTEN',
                          style: blackbold20,
                        ),
                      ),
                      // Love Icon and Fade animation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Fade animation for the product description
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: Desc(
                              'Meja, hijau muda/putih, 120x60 cm',
                              'Rp1.909.000',
                              '4.5 | Terjual 116',
                              'Ruang terbatas bukan berarti Anda harus menolak\nbelajar atau bekerja dan rumah. Meja ini memakan sedikit\nruang lantai namun masih memiliki unit laci tempat\nAnda dapat menyimpan kertas dan barang penting lainnya.',
                              
                            ),
                          ),
                          // Love Icon
                          GestureDetector(
                            onTap: () {
                              _toggleLoveIcon();
                            },
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _loveIconScaleAnimation.value,
                                  child: _isLoved
                                      ? SvgPicture.string(
                                          '${Loved}',
                                          width:
                                              20.0, // Sesuaikan ukuran ikon love yang diinginkan
                                          height:
                                              20.0, // Sesuaikan ukuran ikon love yang diinginkan
                                        )
                                      : SvgPicture.string(
                                          '${Love}',
                                          width:
                                              20.0, // Sesuaikan ukuran ikon love yang diinginkan
                                          height:
                                              20.0, // Sesuaikan ukuran ikon love yang diinginkan
                                        ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomDetail(),
    );
  }
}

