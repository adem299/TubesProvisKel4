import 'package:flutter/material.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';
import 'package:lendyv1/util/notif_content_unread.dart';

import '/util/card_notif.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            title: Text('Notification'),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text('Unread'),
                ),
                Tab(
                  child: Text('All'),
                ),
                Tab(
                  icon: Icon(Icons.delete_rounded),
                )
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
            child: TabBarView(children: [
              NotifContentUnread(),
              NotifContentUnread(),
              NotifContentUnread(),
            ]),
          )),
    );
  }
}
