import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/activity_detail_page.dart';
import 'package:lendyv1/util/card_activity.dart';

class ActivityContentSemua extends StatelessWidget {
  const ActivityContentSemua({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ActivityDetailPage()),
              );
            },
            child: CardActivity(
                warna: Color(0xffeae2b7),
                nama: "Labib",
                deskripsi: "Tahu Sumedang",
                nominal: "Rp. 13.000.000",
                tenggat: "21 Jul"),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ActivityDetailPage()),
              );
            },
            child: CardActivity(
                warna: Color(0xfff28482),
                nama: "Labib",
                deskripsi: "Tahu Sumedang",
                nominal: "Rp. 12.000.000",
                tenggat: "21 Jul"),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ActivityDetailPage()),
              );
            },
            child: CardActivity(
                warna: Color(0xff84a59d),
                nama: "Labib",
                deskripsi: "Tahu Sumedang",
                nominal: "Rp. 12.000.000",
                tenggat: "21 Jul"),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
