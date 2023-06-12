import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/start/login_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class RegisterPage extends StatefulWidget {
  // final VoidCallback showLoginPage;

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> dropdownOptions = ['Peminjam', 'Investor'];

  String? dropdownValue;
  bool checkBox = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future _register() async {
    try {
      if (passConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim());
      }
    } on Exception catch (e) {
      // TODO
      print(e);
      return null;
    }
  }

  bool passConfirmed() {
    return (passController.text.trim() == repassController.text.trim())
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 80,
                color: AppColors.starColor,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                height: 80,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB2B2B2)),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: 'Type your ursername',
                      focusColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70), // Set the desired color
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: 'Type your Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70), // Set the desired color
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB2B2B2)),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: 'Type your Password',
                      prefixIcon: Icon(
                        Icons.key_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70), // Set the desired color
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    controller: passController,
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Konfirmasi Password',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB2B2B2)),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: 'Confirm your password',
                      prefixIcon: Icon(
                        Icons.key_rounded,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70), // Set the desired color
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    controller: repassController,
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Pilih Pengguna',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB2B2B2)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text(
                      'Pilih sebagai',
                      style: TextStyle(color: Colors.white70),
                    ),
                    value: dropdownValue,
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: dropdownOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Color(0xffB4B4B4)),
                        ),
                      );
                    }).toList(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      // add more style properties as needed
                    ),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Color(0xFF006466),
                        value: this.checkBox,
                        onChanged: (value) {
                          setState(() {
                            this.checkBox = value!;
                          });
                        },
                      ),
                      Text(
                        'Accept the Term Of Service and Privacy police',
                        style:
                            TextStyle(fontSize: 13.0, color: Color(0xFFB4B4B4)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 55,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.starColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Get.to(HomePage());
                          _register();
                        },
                        child: Text('Sign up'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?,',
                        style: TextStyle(color: Color(0xFFB4B4B4)),
                      ),
                      InkWell(
                        child: Text(
                          ' Sign In',
                          style: TextStyle(color: AppColors.starColor),
                        ),
                        onTap:
                            // widget.showLoginPage,
                            () {
                          //   // Get.to(LoginPage()); // opsi2
                          Navigator.of(context).push(
                            // opsi1
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
