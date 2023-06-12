import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/update_profile_bisnis_borrower.dart';

class TambahProfilBisnisBorrower extends StatefulWidget {
  TambahProfilBisnisBorrower({Key? key}) : super(key: key);

  @override
  _TambahProfilBisnisBorrowerState createState() =>
      _TambahProfilBisnisBorrowerState();
}

class _TambahProfilBisnisBorrowerState
    extends State<TambahProfilBisnisBorrower> {
  String selectedValue = 'Option 1';

  final List<String> titles = [
    'Nama Bisnis',
    'Alamat',
    'RT',
    'RW',
    'Kelurahan',
    'Kecamatan',
    'Kota',
    'Provinsi',
    'Kode Pos',
    'Omset Bisnis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Bisnis'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff72D1D5),
                Color.fromARGB(255, 0, 0, 0),
              ],
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
            SizedBox(height: 20),
            Container(
              width: 400,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                // color: Color(0xff72D1D5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white, // Warna garis

                  width: 1, // Lebar garis
                ),
              ),
              child: DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: 'Blade of Despair (BOD)',
                    child: Text('Blade of Despair (BOD)'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bisnis 2',
                    child: Text('Bisnis 2'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bisnis 3',
                    child: Text('Bisnis 3'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bisnis 4',
                    child: Text('Bisnis 4'),
                  ),
                ],
                onChanged: (value) {
                  // TODO: Handle dropdown value change
                },
                isExpanded: true,
                hint: Text(
                  'Pilih Bisnis Anda',
                  style: TextStyle(color: Colors.white),
                ),
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
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Batagor of Despair (BOD)',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                if (titles[index] == 'Omset Bisnis') {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            color: Color.fromARGB(255, 137, 135, 135),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      DropdownButton<String>(
                                        items: <DropdownMenuItem<String>>[
                                          DropdownMenuItem<String>(
                                            value: 'Option 1',
                                            child: Text(
                                              ' Per Hari',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 137, 135, 135),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Option 2',
                                            child: Text(
                                              'Per Minggu',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 137, 135, 135),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Option 3',
                                            child: Text(
                                              'Per Bulan',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 137, 135, 135),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Option 4',
                                            child: Text(
                                              'Per Tahun',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 137, 135, 135),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                        onChanged: (String? newValue) {
                                          // Tambahkan logika ketika drop-down diubah
                                        },
                                        dropdownColor: Colors.grey[800],
                                        underline:
                                            Container(), // Menghilangkan garis bawah default
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        value:
                                            selectedValue, // Variabel untuk menyimpan nilai terpilih
                                        hint: Text(
                                          'Pilih opsi',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                            color: Color.fromARGB(255, 137, 135, 135),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
              padding: EdgeInsets.only(
                  top: 20, left: 20), // Atur jarak ke atas sesuai kebutuhan
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pinjaman',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kategori',
                    style: TextStyle(
                      color: Color.fromARGB(255, 137, 135, 135),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nominal',
                    style: TextStyle(
                      color: Color.fromARGB(255, 137, 135, 135),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tenggat Pengembalian',
                    style: TextStyle(
                      color: Color.fromARGB(255, 137, 135, 135),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TambahProfilBisnisBorrower();
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
