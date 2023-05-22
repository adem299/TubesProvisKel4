import 'package:flutter/material.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';
import 'package:lendyv1/util/card_activity.dart';
import 'package:lendyv1/util/notif_content_unread.dart';

import 'activity/activity_content_diajukan.dart';
import 'activity/activity_content_gagal.dart';
import 'activity/activity_content_semua.dart';
import 'activity/activity_content_sukses.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text('Aktivitas Transaksi'),
          automaticallyImplyLeading: false,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text('Semua'),
              ),
              Tab(
                child: Text('Diajukan'),
              ),
              Tab(
                child: Text('Sukses'),
              ),
              Tab(
                child: Text('Gagal'),
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff001523),
                Color(0xFF006466),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(children: [
              ActivityContentSemua(),
              ActivityContentDiajukan(),
              ActivityContentSukses(),
              ActivityContentGagal(),
            ]),
          ),
        ),
      ),
    );
  }
}
