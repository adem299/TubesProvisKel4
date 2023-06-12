import 'package:flutter/material.dart';
import 'package:lendyv1/util/card_activity.dart';

class ActivityContentGagal extends StatelessWidget {
  const ActivityContentGagal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: Color(0xfff28482),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: Color.fromARGB(255, 236, 109, 107),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Gagal',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diterima:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    warna: Color(0xfff28482),
                    nama: "Afina",
                    deskripsi: "Basreng",
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
                builder: (BuildContext context) {
                  return Container(
                    color: Color(0xfff28482),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: Color.fromARGB(255, 236, 109, 107),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Gagal',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diterima:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    warna: Color(0xfff28482),
                    nama: "Salman",
                    deskripsi: "Tahu Sumedang",
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
                builder: (BuildContext context) {
                  return Container(
                    color: Color(0xfff28482),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            color: Color.fromARGB(255, 236, 109, 107),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Gagal',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diterima:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    warna: Color(0xfff28482),
                    nama: "Ade",
                    deskripsi: "Gacoan",
                    nominal: "Rp. 12.000.000",
                    tenggat: "21 Jul",
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
