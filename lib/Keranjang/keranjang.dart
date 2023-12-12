


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikea/Keranjang/components/appbar.dart';
import 'package:ikea/Keranjang/components/makinglist.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/theme/color.dart';
import 'package:intl/intl.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  int index_mackapar = 1;
  int index_alex = 1;
  int harga_mackapar = 1499000;
  int harga_alex = 1350000;
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 9.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: '2 ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          TextSpan(text: 'barang', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index_alex = 0;
                          index_mackapar = 0;
                        });
                      },
                      child: Text(
                        'Hapus semua',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Wrap(
                  runSpacing: 24.0,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Makinglist is a custom widget, you can replace it with your widget
                        Makinglist(context, harga_alex, 'images/laci-abu.png',
                            'ALEX', 'Unit laci, abu-abu toska,\n36x70 cm'),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 72,
                              height: 37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      index_alex = 0;
                                    });
                                  },
                                  child: SvgPicture.string('${Trash}'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: 183,
                              height: 37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (index_alex > 0) {
                                        setState(() {
                                          index_alex -= 1;
                                        });
                                      }
                                    },
                                    child: SvgPicture.string('${Minus}'),
                                  ),
                                  Text(index_alex.toString()),
                                  InkWell(
                                    onTap: () {
                                      if (index_alex > -1) {
                                        setState(() {
                                          index_alex = index_alex + 1;
                                        });
                                      }
                                    },
                                    child: SvgPicture.string('${Plus}'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Makinglist(
                            context,
                            harga_mackapar,
                            'images/macpae.png',
                            'MACKAPÄR',
                            'Kabinet/tempat sepatu, putih,\n80x35x102 cm'),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 72,
                              height: 37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      index_mackapar = 0;
                                    });
                                  },
                                  child: SvgPicture.string('${Trash}'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: 183,
                              height: 37,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (index_mackapar > 0) {
                                        setState(() {
                                          index_mackapar -= 1;
                                        });
                                      }
                                    },
                                    child: SvgPicture.string('${Minus}'),
                                  ),
                                  Text(index_mackapar.toString()),
                                  InkWell(
                                    onTap: () {
                                      if (index_mackapar > -1) {
                                        setState(() {
                                          index_mackapar = index_mackapar + 1;
                                        });
                                      }
                                    },
                                    child: SvgPicture.string('${Plus}'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: Color(0xffE7E7E7)))),
        height: 104,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${formatRupiah(index_alex * harga_alex + index_mackapar * harga_mackapar)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Ink(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _showDeliveryInformationDialog();
                  },
                  child: Container(
                    width: 181,
                    height: 56,
                    decoration: BoxDecoration(color: Color(0xff0058AB)),
                    child: Center(
                      child: Text(
                        'Beli',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDeliveryInformationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Lokasi Pengiriman'),
          content: Column(
            children: [
              Text('Masukkan alamat pengiriman:'),
              SizedBox(height: 8),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'Alamat Pengiriman',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSuccessDialog();
              },
              child: Text('Pilih'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pembelian Berhasil'),
          content: Column(
            children: [
              Text('Terima kasih atas pembelian Anda!'),
              SizedBox(height: 8),
              Text('Alamat Pengiriman: ${addressController.text}'),
              SizedBox(height: 16),
              Text('Pesanan akan segera diantarkan.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String formatRupiah(int harga) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return currencyFormat.format(harga);
  }
}