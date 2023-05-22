import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lendyv1/auth/main_page.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/start/login_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        if (isLoading)
          Container(
            color: AppColors.bgColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/logo/logo.png'),
                      width: 300,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      color: Color(0xff71E7E5),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ));
  }
}
