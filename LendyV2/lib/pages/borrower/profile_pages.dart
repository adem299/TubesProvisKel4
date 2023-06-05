import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lendyv1/pages/borrower/list_rating_page.dart';
import 'package:lendyv1/pages/borrower/profile_pribadi_borrower.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // sign out
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //  Profile avatar
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage('assets/images/lisa.jpg')),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      // user.email!,
                      "Lisa 123",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: AppColors.textColors2),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // feature pinjaman - UMKM - Rating
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '4',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'Pinjaman',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '7',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          'UMKM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ListRatingPage(),
                              ),
                            );
                          },
                          child: Text(
                            '4.9',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Profile Pribadi'),
                          // subtitle: Text('Ini subtitle'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfilPribadiBorrower(),
                              ),
                            );
                          },
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text('Profile Bisnis'),
                          // subtitle: Text('Ini subtitle'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // Transaction
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaksi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Riwayat Pinjaman',
                          style: TextStyle(color: Colors.white),
                        ),
                        // subtitle: Text('Ini subtitle'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),

                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
              // Bantuan
              SizedBox(
                height: 25,
              ),
              // Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.note_alt_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Syarat dan ketentuan',
                          style: TextStyle(color: Colors.white),
                        ),
                        // subtitle: Text('Ini subtitle'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        // tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),

                        onTap: () {},
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help_center_rounded,
                          color: Colors.white,
                        ),

                        title: Text(
                          'Pusat Bantuan',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        // subtitle: Text('Ini subtitle'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        // tileColor: Colors.grey[200],
                        onTap: () {},
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.call_end_rounded,
                          color: Colors.white,
                        ),

                        title: Text(
                          'Kontak kami',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        // subtitle: Text('Ini subtitle'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        // tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
