import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/profile_borower_update.dart';
// import 'package:lendyv3/pages/borrower/update_profile_pribadi_borower.dart';
// import 'package:lendyv1/util/Color/ColorCustom.dart';

class ProfilPribadiBorrower extends StatefulWidget {
  ProfilPribadiBorrower({Key? key}) : super(key: key);

  @override
  _ProfilPribadiBorrower createState() => _ProfilPribadiBorrower();
}

class _ProfilPribadiBorrower extends State<ProfilPribadiBorrower> {
  final List<String> titles = [
    'Nomor Handphone',
    'Alamat Email',
    'Pekerjaan',
    'Perangkat Terhubung',
    'Alamat',
    'RT',
    'RW',
    'Kelurahan',
    'Kecamatan',
    'Kota',
    'Provinsi',
    'Kode Pos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Anda'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff72D1D5),
                Color.fromARGB(255, 0, 0, 0)
              ], // Atur warna gradien sesuai kebutuhan
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/lisa.jpg'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'AlipParampampam Uye',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                if (titles[index] == 'Alamat') {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamat Domisili',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Alamat', // Teks "alamat" yang sudah ada sebelumnya
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), // Spasi antara judul dan teks "alamat"
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (titles[index] == 'Alamat Email') {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonFormField<String>(
                            items: [
                              DropdownMenuItem<String>(
                                value: 'Ubah Password',
                                child: Text('Ubah Password'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Ubah PIN',
                                child: Text('Ubah PIN'),
                              ),
                            ],
                            onChanged: (value) {
                              // TODO: Handle dropdown value change
                            },
                            isExpanded: true,
                            hint: Text('Keamanan'),
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                            ),
                            dropdownColor: Colors.white,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UpdateProfilPribadiBorrower();
                  }));
                },
                child: Text(
                  'Edit Profile Pribadi',
                  style: TextStyle(
                      color: Colors.black, // Ubah warna teks menjadi putih
                      fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 22, horizontal: 60),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(
                        0xff72D1D5), // Ganti dengan warna gradien yang diinginkan
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
