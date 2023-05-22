import 'package:flutter/material.dart';
import 'package:lendyv1/auth/main_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lendyv1/pages/borrower/start/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
