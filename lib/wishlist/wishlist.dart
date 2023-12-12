// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/Keranjang/keranjang.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';
import 'package:ikea/wishlist/components/appbar.dart';
import 'package:ikea/wishlist/components/list.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust animation duration
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<GestureDetector> iseng = [];
  static List<ListWishtlist> list_barang = [
    ListWishtlist(
      images: 'images/laci-abu.png',
      title: 'ALEX',
      desc: 'Unit laci, abu-abu toska,\n36x70 cm',
      harga: 'Rp1.350.000',
    ),
    ListWishtlist(
      images: 'images/chair-desk.png',
      title: 'MILLBERGET',
      desc: 'Kursi putar, murum hitam',
      harga: 'Rp1.799.000',
    ),
    ListWishtlist(
      images: 'images/bed-big.png',
      title: 'SONGESAND',
      desc: 'Rngk tmpt tdr dg 2 ktk penyim\npanan, cokelat, 160x200 cm',
      harga: 'Rp3.499.000',
    ),
    ListWishtlist(
      images: 'images/lamps.png',
      title: 'HEKTAR',
      desc: 'Lampu lantai, abu-abu tua',
      harga: 'Rp1.299.000',
    ),
  ];

  List<ListWishtlist> merek_barang = List.of(list_barang);

  void updateList(String value) {
    setState(() {
      merek_barang = list_barang
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWishlist(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  hintText: 'Cari barang diwishlist',
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
           
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '4 ', style: blackbold),
                      TextSpan(text: 'barang', style: graynormal),
                    ],
                  ),
                ),
                SvgPicture.string('${Bars}')
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: merek_barang.length,
                itemBuilder: (context, index) => FadeTransition(
                  opacity: _animation, // Apply the fade-in animation
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          merek_barang[index].images,
                          fit: BoxFit.cover,
                          width: 99,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(merek_barang[index].title, style: blackbold16),
                            SizedBox(height: 6.0),
                            Text('${merek_barang[index].desc}'),
                            SizedBox(height: 12.0),
                            Text('${merek_barang[index].harga}',
                                style: blackbold16),
                            SizedBox(height: 12.0),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Keranjang()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Color(0xff0058AB))),
                                width: 200,
                                height: 38,
                                child: Center(
                                    child: Text(
                                  'Tambah ke Keranjang',
                                  style: TextStyle(
                                    color: Color(0xffff0058AB),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                )),
                              ),
                            )
                          ],
                        ),
                        SvgPicture.string('${Mores}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
