import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/list_pengajuan_page.dart';
import 'package:lendyv1/pages/borrower/list_rating_page.dart';
import 'package:lendyv1/pages/borrower/profile_pages.dart';
import 'package:lendyv1/pages/borrower/umkm/list_umkm_page.dart';
import 'package:lendyv1/util/topup/top_up_page.dart';

import 'activity/activity_content_semua.dart';
import 'history/riwayat_pinjaman_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          //// error
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const ProfilePage(),
                          //   ),
                          // );
                        },
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/images/lisa.jpg'),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 25,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Helo User",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Good Morning",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
                    width: 314,
                    height: 145,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Anda',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp. 50.000.000',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const TopUpPage(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add_box_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Search bar
            // TextField(
            //   style: TextStyle(color: Colors.white),
            //   decoration: InputDecoration(
            //       filled: true,
            //       fillColor: Colors.white54,
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide: BorderSide.none,
            //       ),
            //       hintText: "eg: Kuliner",
            //       prefixIcon: Icon(Icons.search_rounded),
            //       prefixIconColor: Colors.white),
            // ),
            SizedBox(
              height: 35,
            ),
            // Card
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(RiwayatPinjamanPage());
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  // color: Colors.deepPurple[200],
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff364156),
                                      Color(0xff13232c),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.4, 0.7],
                                    tileMode: TileMode.repeated,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.receipt_long_rounded,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '10',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Transaksi',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ListPengajuanPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff15333a),
                                      Color(0xff256d66),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.4, 0.7],
                                    tileMode: TileMode.repeated,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.tag_faces_outlined,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '7',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Tagihan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.to(ListUmkmPage());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ListUmkmPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffa47e1b),
                                      Color(0xff805b10),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.4, 0.7],
                                    tileMode: TileMode.repeated,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopify_rounded,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'UMKM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(ListRatingPage());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ListRatingPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff35007a),
                                      Color(0xff7a007a),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.4, 0.7],
                                    tileMode: TileMode.repeated,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star_border_rounded,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '4.9',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Rating',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
