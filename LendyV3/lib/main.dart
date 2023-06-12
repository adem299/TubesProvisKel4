import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lendyv1/auth/auth_page.dart';
import 'package:lendyv1/auth/main_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lendyv1/keyboard/keyboar.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/start/loading_page.dart';
import 'package:lendyv1/pages/borrower/start/login_page.dart';
import 'package:lendyv1/pages/investor/investor_root_page.dart';
import 'package:lendyv1/pages/visitor/visitor.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ActivityModel>(
          create: (context) => ActivityModel(username: '-', wallet: 0),
        ),
        ChangeNotifierProvider<CountUmkmModel>(
          create: (context) => CountUmkmModel(umkm_count: 0),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: VisitrPage1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//simpan variabel atau state di sini
class ActivityModel extends ChangeNotifier {
  String url = "http://192.168.64.153:8000/peminjam/2";
  String username;
  double wallet;

  ActivityModel({required this.username, required this.wallet}); //constructor

  //map dari json ke atribut
  void setFromJson(json) {
    username = json['username'];
    wallet = json['wallet'];
    notifyListeners(); //infokan bahwa data berubah!
  }

  //ambil data dari API secara async
  void fetchData(int id) async {
    url = "http://192.168.64.153:8000/peminjam/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // sukses, lakukan parsing
      setFromJson(jsonDecode(response.body));
    } else {
      // gagal
      throw Exception('Gagal panggil API');
    }
  }
}

class CountUmkmModel extends ChangeNotifier {
  String url = "http://192.168.64.153:8000/peminjam/2";
  int umkm_count;

  CountUmkmModel({required this.umkm_count}); //constructor

  //map dari json ke atribut
  void setFromJson(json) {
    umkm_count = json['umkm_count'];
    notifyListeners(); //infokan bahwa data berubah!
  }

  //ambil data dari API secara async
  void fetchData(int id) async {
    url = "http://192.168.64.153:8000/umkm/count/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // sukses, lakukan parsing
      setFromJson(jsonDecode(response.body));
    } else {
      // gagal
      throw Exception('Gagal panggil API');
    }
  }
}
