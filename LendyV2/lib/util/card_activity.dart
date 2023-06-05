import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  final Color warna;
  final String nama;
  final String deskripsi;
  final String nominal;
  final String tenggat;

  const CardActivity({
    super.key,
    required this.warna,
    required this.nama,
    required this.deskripsi,
    required this.nominal,
    required this.tenggat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      decoration:
          BoxDecoration(color: warna, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/icons/toko.jpeg'),
                  width: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                // Icon(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      deskripsi,
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(nominal,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(tenggat)
              ],
            )
          ],
        ),
      ),
    );
  }
}
