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
          CardActivity(
              warna: Color(0xfff28482),
              nama: "Labib",
              deskripsi: "Tahu Sumedang",
              nominal: "Rp. 13.000.000",
              tenggat: "21 Jul"),
          SizedBox(
            height: 10,
          ),
          CardActivity(
              warna: Color(0xfff28482),
              nama: "Ade",
              deskripsi: "Tahu Sumedang",
              nominal: "Rp. 12.000.000",
              tenggat: "21 Jul"),
          SizedBox(
            height: 10,
          ),
          CardActivity(
              warna: Color(0xfff28482),
              nama: "Salman",
              deskripsi: "Tahu Sumedang",
              nominal: "Rp. 12.000.000",
              tenggat: "21 Jul"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
