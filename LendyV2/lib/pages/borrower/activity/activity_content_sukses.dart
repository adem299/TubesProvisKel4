import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/activity_detail_page.dart';
import 'package:lendyv1/util/card_activity.dart';

class ActivityContentSukses extends StatelessWidget {
  const ActivityContentSukses({Key? key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final nearestDeadline = DateTime(today.year, today.month, today.day + 7);

    bool hasClosestDeadline = false;
    if (nearestDeadline.isAfter(today)) {
      hasClosestDeadline = true;
    }

    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                SizedBox(
                  height: 10,
                ),
                if (hasClosestDeadline)
                  Text(
                    'Tenggat Waktu Terdekat',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (hasClosestDeadline)
                  SizedBox(
                    height: 10,
                  ),
                if (hasClosestDeadline)
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            // Tambahkan SingleChildScrollView di sini
                            child: Container(
                              color: Color(0xff84a59d),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Detail Transaksi',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff6E8982),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Status:',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Sukses',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Timestamp:',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Spacer(),
                                              Text(
                                                '10 Apr 2022, 13:00',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'From:',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Lisa',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jumlah:',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Rp. 78.000.000',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Diterima:',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Spacer(),
                                              Text(
                                                'Rp. 78.000.000',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 50),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Aksi yang ingin Anda lakukan saat tombol "Selanjutnya" ditekan
                                        // Misalnya, pindah ke halaman berikutnya
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ActivityDetailPage(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors
                                            .black, // Ubah warna latar belakang button sesuai keinginan Anda
                                        onPrimary: Colors
                                            .white, // Warna teks dan ikon sebelum diklik
                                      ),
                                      child: Text('Selanjutnya'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CardActivity(
                            warna: Color(0xff84a59d),
                            nama: "Labib",
                            deskripsi: "Tahu Sumedang",
                            nominal: "Rp. 12.000.000",
                            tenggat: "21 Jul",
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Semua',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          // Tambahkan SingleChildScrollView di sini
                          child: Container(
                            color: Color(0xff84a59d),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Detail Transaksi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                SizedBox(height: 30),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff6E8982),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Status:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Sukses',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Timestamp:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              '10 Apr 2022, 13:00',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'From:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Lisa',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Jumlah:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Rp. 78.000.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Diterima:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Rp. 78.000.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Aksi yang ingin Anda lakukan saat tombol "Selanjutnya" ditekan
                                      // Misalnya, pindah ke halaman berikutnya
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .black, // Ubah warna latar belakang button sesuai keinginan Anda
                                      onPrimary: Colors
                                          .white, // Warna teks dan ikon sebelum diklik
                                    ),
                                    child: Text('Selanjutnya'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CardActivity(
                          warna: Color(0xff84a59d),
                          nama: "Alif",
                          deskripsi: "Perlengkapan Olahraga",
                          nominal: "Rp. 12.000.000",
                          tenggat: "21 Jul",
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          // Tambahkan SingleChildScrollView di sini
                          child: Container(
                            color: Color(0xff84a59d),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Detail Transaksi',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                SizedBox(height: 30),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff6E8982),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Status:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Sukses',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Timestamp:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              '10 Apr 2022, 13:00',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'From:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Lisa',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Jumlah:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Rp. 78.000.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        title: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Diterima:',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Rp. 78.000.000',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Aksi yang ingin Anda lakukan saat tombol "Selanjutnya" ditekan
                                      // Misalnya, pindah ke halaman berikutnya
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors
                                          .black, // Ubah warna latar belakang button sesuai keinginan Anda
                                      onPrimary: Colors
                                          .white, // Warna teks dan ikon sebelum diklik
                                    ),
                                    child: Text('Selanjutnya'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CardActivity(
                          warna: Color(0xff84a59d),
                          nama: "Afina",
                          deskripsi: "Kosmetik",
                          nominal: "Rp. 12.000.000",
                          tenggat: "21 Jul",
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
