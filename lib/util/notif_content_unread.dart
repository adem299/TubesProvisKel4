import 'package:flutter/material.dart';

import 'card_notif.dart';

class NotifContentUnread extends StatelessWidget {
  const NotifContentUnread({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          CardNotif(
            date: 'Saturday, July 13th 2023',
            description:
                'Pembayaran cicilan sebesar 5.000.000 pada pinjaman UMKM tahu sumedang telah berhasil terkirim.',
          ),
          CardNotif(
            date: 'Sunday, April 22th 2022',
            description:
                'Pembayaran cicilan sebesar 10.0000.000 pada pinjaman UMKM kosmetik telah berhasil terkirim.',
          ),
          CardNotif(
            date: 'Monday, January 15th 2023',
            description:
                'Investor Lisa tidak setuju dengan perpanjangan waktu peminjaman yang di di ajukan.',
          ),
        ],
      ),
    );
  }
}
