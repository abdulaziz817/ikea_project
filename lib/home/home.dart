// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ikea/detail-produck/detail.dart';
import 'package:ikea/home/components/Colection.dart';
import 'package:ikea/home/components/appBar.dart';
import 'package:ikea/home/components/category.dart';
import 'package:ikea/home/components/complete-text.dart';
import 'package:ikea/home/components/list.dart';
import 'package:ikea/home/components/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 24,
              ),
              Searching(onChanged: (String query) {}),
              SizedBox(
                height: 24,
              ),
              Image.asset('images/promo.jpg'),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Category('images/bed.png', "Kamar Tidur"),
                        Category('images/desk.png', "Ruang Kerja"),
                        Category('images/kitchen.png', "Dapur"),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Category('images/doll.png', "Bayi & Anak"),
                        Category('images/towl.png', "Tekstil"),
                        Category('images/table.png', "Penyimpanan")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Sub('Produk Populer', 'Lihat Semua'),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12,
                  children: [
                    Populer('images/cail.png', 'KROKFJORDEN',
                        'Pengait dengan \nplastik isap ...', 'Rp99.900'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProduck()));
                      },
                      child: Populer(
                        'images/tabledesk.png',
                        'ALEX/LAGKAPTEN',
                        'Meja, hijau muda/\nputih, 120x60 cm',
                        'Rp1.909.000',
                      ),
                    ),
                    Populer(
                        'images/lemari.png',
                        'FARDAL/PAX',
                        'Kombinasi lemari\npakaian, putih/hig...',
                        'Rp8.400.000'),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Sub('Telusuri Koleksi Kami', 'Lihat Semua'),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12,
                  children: [
                    Koleksi(
                        const Color(0xff4F707F),
                        'images/sea.png',
                        'BLÅVINGAD',
                        'Koleksi yang\nterinspirasi dari lautan\nuntuk menciptakan ...'),
                    Koleksi(
                        const Color(0xff5E4238),
                        'images/christmast.png',
                        'VINTERFINT',
                        'Koleksi VINTERFINT\nhadir dengan warna\ndan pola indah ...'),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Sub('Penawaran Terkini', 'Lihat Semua'),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12,
                  children: [
                    Image.asset(
                      'images/potogan-harga.png',
                      width: 183,
                      height: 150,
                    ),
                    Image.asset(
                      'images/penawaran.png',
                      width: 183,
                      height: 150,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
