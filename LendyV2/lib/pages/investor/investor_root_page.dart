import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/activity_page.dart';
import 'package:lendyv1/pages/borrower/main/pengajuan_page.dart';
import 'package:lendyv1/pages/borrower/notification_page.dart';
import 'package:lendyv1/pages/borrower/profile_pages.dart';
import 'package:lendyv1/pages/investor/activity_inv_page.dart';
import 'package:lendyv1/pages/investor/penerimaan_peminjam.dart';
import 'package:lendyv1/pages/investor/start/investor_home_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class InvestorRoot extends StatefulWidget {
  const InvestorRoot({super.key});

  @override
  State<InvestorRoot> createState() => _InvestorRootState();
}

class _InvestorRootState extends State<InvestorRoot> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    InvestorHomePage(),
    NotificationPage(),
    PenerimaanPeminjamPage(),
    ActivityPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_rounded),
            label: 'Ajukan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        iconSize: 30,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 4, 196, 199),
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: _onItemTapped,
        backgroundColor: AppColors.bgColor,
      ),
      backgroundColor: Color(0xff001523),
      body: SafeArea(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
