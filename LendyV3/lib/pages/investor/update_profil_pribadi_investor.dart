import 'package:flutter/material.dart';
import 'profile_pribadi_investor.dart';

class UpdateProfilPribadiInvestor extends StatefulWidget {
  UpdateProfilPribadiInvestor({Key? key}) : super(key: key);

  @override
  _UpdateProfilPribadiInvestorState createState() =>
      _UpdateProfilPribadiInvestorState();
}

class _UpdateProfilPribadiInvestorState
    extends State<UpdateProfilPribadiInvestor> {
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
        title: Text('Edit Profil'),
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage('assets/images/lisa.jpg'),
                      ),
                      Positioned(
                        top: 110,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors
                            //     .blue, // Atur warna badge sesuai kebutuhan
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors
                                .white, // Atur warna ikon pada badge sesuai kebutuhan
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200, // Atur panjang TextField sesuai kebutuhan
                    child: TextField(
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        color: Colors.white, // Ubah warna teks menjadi putih
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 00),
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Aksi ketika ikon pensil diklik
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  )
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
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Alamat', // Teks "alamat" yang sudah ada sebelumnya
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), // Spasi antara judul dan teks "alamat"
                        TextField(
                          style: TextStyle(
                            // fontSize: 23,
                            // fontWeight: FontWeight.w500,
                            // letterSpacing: 0.2,
                            color:
                                Colors.white, // Ubah warna teks menjadi putih
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.black,
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
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            // fontSize: 23,
                            // fontWeight: FontWeight.w500,
                            // letterSpacing: 0.2,
                            color:
                                Colors.white, // Ubah warna teks menjadi putih
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Ubah warna container menjadi putih
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
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            // fontSize: 23,
                            // fontWeight: FontWeight.w500,
                            // letterSpacing: 0.2,
                            color:
                                Colors.white, // Ubah warna teks menjadi putih
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.black,
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
                    return ProfilPribadiInvestor();
                  }));
                },
                child: Text(
                  'Selesai',
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
