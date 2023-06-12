import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:lendyv1/main.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/start/forgot_password_page.dart';
import 'package:lendyv1/pages/borrower/start/register_page.dart';
import 'package:lendyv1/pages/investor/investor_root_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  int id = 0;

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse('http://192.168.64.153:8000/signin');

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final emailValue = responseData['id'];
      setState(() {
        id = responseData['id'];
      });
      print('Full response body: ${response.body}');
      print('id: $emailValue');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );
      // You can perform further actions with the response data if needed
    } else if (response.statusCode == 401) {
      print('Invalid nama or nim: $email and $password');
    } else {
      print('An error occurred: ${response.body}');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        height: 80,
                        color: AppColors.starColor,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image(
                              image: AssetImage('assets/logo/logo1.png'),
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFB2B2B2)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              TextField(
                                controller: _emailController,
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 96, 97, 97)),
                                  hintText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .white70), // Set the desired color
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFB2B2B2),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              TextField(
                                controller: _passwordController,
                                style: TextStyle(color: Colors.white70),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 96, 97, 97)),
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .white70), // Set the desired color
                                  ),
                                ),
                                obscureText: true,
                                obscuringCharacter: "*",
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ForgotPasswordPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Lupa Password?',
                                  style: TextStyle(
                                      color: AppColors.starColor, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 25),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 250,
                              height: 57,
                              child: Consumer2<ActivityModel, CountUmkmModel>(
                                  builder: (context, nama, count, child) {
                                return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.starColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      await signIn(_emailController.text.trim(),
                                          _passwordController.text.trim());
                                      nama.fetchData(id);
                                      count.fetchData(id);
                                      if (id != 0) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                        );
                                      } else {
                                        // Tambahkan kode untuk menampilkan pesan kesalahan kepada pengguna
                                        print(
                                            'Sign-in failed. Invalid email or password.');
                                      }
                                    } catch (e) {
                                      print('Error: $e');
                                      // Tambahkan kode untuk menampilkan pesan kesalahan kepada pengguna
                                    }
                                  },
                                  child: Text('Login'),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member?',
                                style: TextStyle(color: Color(0xFFB2B2B2)),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(' Register Now',
                                    style: TextStyle(
                                      color: AppColors.starColor,
                                    )),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const InvestorRoot(),
                                ),
                              );
                            },
                            child: Text(
                              'Try Investor Page',
                              style: TextStyle(color: AppColors.starColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
