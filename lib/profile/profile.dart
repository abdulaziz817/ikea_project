// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ikea/custom/svg.dart';
import 'package:ikea/profile/components/appbar.dart';
import 'package:ikea/profile/components/list.dart';
import 'package:ikea/theme/color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isAnimated = false;
  bool _hasReceivedGift = false;
  bool _hasPlacedOrder = false;
  bool _isVerificationFormVisible = true;
  TextEditingController _verificationController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  TextEditingController _jawabanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAnimated = true;
      });
    });
  }

  void _verifyAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Verifikasi Akun'),
              content: _isVerificationFormVisible
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Silakan isi formulir verifikasi:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: _verificationController,
                          decoration: InputDecoration(
                            labelText: 'Nomor Telepon',
                            prefixIcon: Icon(Icons.phone),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Verifikasi Telah Berhasil',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Icon(Icons.check_circle, color: Colors.green, size: 40),
                      ],
                    ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_isVerificationFormVisible) {
                      String phoneNumber = _verificationController.text.trim();
                      if (phoneNumber.startsWith("08") && phoneNumber.length >= 10) {
                        setState(() {
                          _isVerificationFormVisible = false;
                          _hasReceivedGift = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Verifikasi berhasil'),
                            duration: Duration(seconds: 3),
                          ),
                        );

                        print('Verifikasi Telah berhasil');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Nomor Telepon harus diawali dengan "08" dan memiliki minimal 10 karakter.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text(
                    _isVerificationFormVisible ? 'Verifikasi' : 'Lanjutkan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showImageDialog(String imagePath, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: _hasReceivedGift
              ? Image.asset(
                  imagePath,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(message),
                ),
        );
      },
    );
  }

  void _showAboutAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Keluhan Anda'),
          content: Text('Apa yang bisa kami bantu?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showHelpDialog();
              },
              child: Text('Tulis pesan'),
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apa yang bisa kami bantu?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Apa keluhan anda tentang IKEA'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showProcessingDialog();
                },
                child: Text('Kirim'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProcessingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pengiriman Berhasil'),
          content: Text('Permintaan Anda sedang kami proses.. Terima kasih atas kesabarannya..'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ok'),
            ),
          ],
        );
      },
    );
  }

  void _showOrderDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pesanan Saya'),
          content: _hasPlacedOrder
              ? Column(
                  children: [
                    Text('Detail pesanan Anda akan ditampilkan di sini.'),
                    // Add more details as needed
                  ],
                )
              : Text('Anda belum melakukan pesanan.'),
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

  void _showUlasanDialog(double rating) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Terima Kasih',
          style: TextStyle(color: Colors.green), // Ubah warna judul
        ),
        content: Column(
          children: [
            Text(
              'Terima kasih atas ulasan Anda!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: $rating',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.blue), // Ubah warna tombol
            ),
          ),
        ],
      );
    },
  );
}

void _showUlasanSubmissionDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      double userRating = 3;
      return AlertDialog(
        title: Text(
          'Berikan Ulasan',
          style: TextStyle(color: Colors.blue), // Ubah warna judul
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar(
              initialRating: userRating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Icon(Icons.star, color: Colors.orange), // Ubah warna bintang
                half: Icon(Icons.star_half, color: Colors.orange), // Ubah warna setengah bintang
                empty: Icon(Icons.star_border, color: Colors.orange), // Ubah warna bintang kosong
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                userRating = rating;
                print(rating);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showUlasanDialog(userRating);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white), // Ubah warna teks tombol
              ),
            ),
          ],
        ),
      );
    },
  );
}


  void _playTekaTekiGame() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Teka-Teki IKEA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selamat datang di Teka-Teki IKEA!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Tebak kata: Saya adalah sebuah perusahaan furnitur terkenal.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _jawabanController,
                decoration: InputDecoration(
                  labelText: 'Jawaban',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                String jawaban = _jawabanController.text.toLowerCase();
                if (jawaban == "ikea") {
                  setState(() {
                    _hasReceivedGift = true;
                  });

                  _showImageDialog('images/gift.png', 'Selamat! Anda mendapatkan reward dari IKEA.');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Maaf!'),
                        content: Text('Jawaban Anda salah. Coba lagi lain waktu!'),
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
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarProfile(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 26.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _verifyAccount();
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: _isAnimated ? 100 : 0,
                        child: Hero(
                          tag: 'profileImage',
                          child: Image.asset(
                            'images/barcode.png',
                            width: 84,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: _isAnimated ? 1.0 : 0.0,
                          child: Text(
                            'Rizqi Fatur',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: _isAnimated ? 1.0 : 0.0,
                          child: Text(
                            '160002359102020',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _isAnimated ? 1.0 : 0.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        color: Colors.white.withOpacity(0.1),
                        child: Column(
                          children: [
                            ListProfile('${Profiles}', 'Profil Saya'),
                            ListTile(
                              leading: SvgPicture.string('${Packet}'),
                              title: Text('Pesanan'),
                              onTap: () {
                                _showOrderDetailsDialog();
                              },
                            ),
                            ListTile(
                              leading: SvgPicture.string('${StartOutline}'),
                              title: Text('Ulasan'),
                              onTap: () {
                                _showUlasanSubmissionDialog();
                              },
                            ),
                            ListTile(
                              leading: SvgPicture.string('${Gift}'),
                              title: Text('Reward Saya'),
                              onTap: () {
                                _playTekaTekiGame();
                              },
                            ),
                            ListTile(
                              leading: SvgPicture.string('${Help}'),
                              title: Text('Bantuan'),
                              onTap: () {
                                _showAboutAccountDialog();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
