import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/main/succes_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class AjukanPage extends StatefulWidget {
  const AjukanPage({super.key});

  @override
  State<AjukanPage> createState() => _AjukanPageState();
}

class _AjukanPageState extends State<AjukanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan'),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff001523),
              Color(0xFF006466),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: ListView(
            children: [
              Container(
                height: 190,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: const LinearGradient(
                    colors: [Color(0xff001f68), Color(0xff200461)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    stops: [0.4, 0.7],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Cicilan Perbulan',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            '*sudah termasuk bunga',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        'RP. 20.000.000',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Jumlah Pinjaman',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Lama Pinjaman',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Bisnis yang Diajukan',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Keterangan',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Foto KTP',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset('assets/images/ktpBig.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF006466))),
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>
                            ConfirmationDialog());
                  },
                  child: Text('Ajukan Pinjaman')),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'PERINGATAN!',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.grey[300],
      content: Container(
        height: 350,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 125, 166, 167),
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nominal :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('Rp. 50.000.000',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cicilan / Bulan :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('Rp. 7.500.000',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lama Pinjaman :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('3 Bulan',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tenggat Pengembalian :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('5 July 2022',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nama Bisnis :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('Tahu Sumedang',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Kategori :',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('Kuliner',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Dengan mengisi box ini, maka anda menyetujui semua persyaratan yang berlaku, serta bersedia mengikuti persyaratan ketika membayar dana yang melebihi batas waktu yang berlaku. ',
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF006466))),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SuccessPage(),
                ),
              );
            },
            child: const Text('Selanjutnya'),
          ),
        ),
      ],
    );
  }
}
