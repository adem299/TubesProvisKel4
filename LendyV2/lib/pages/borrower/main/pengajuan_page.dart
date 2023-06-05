import 'package:flutter/material.dart';
import 'package:lendyv1/pages/borrower/main/ajukan_page.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';

class PengajuanPage extends StatefulWidget {
  const PengajuanPage({super.key});

  @override
  State<PengajuanPage> createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengajuan'),
        automaticallyImplyLeading: false,
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
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Jumlah Pinjaman',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white70), // Set the desired color
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Lama Pinjaman',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white70), // Set the desired color
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Bisnis yang diajukan',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white70), // Set the desired color
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Keterangan',
                  hintStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white70), // Set the desired color
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Foto KTP',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.starColor,
                        width: 3.0,
                        style: BorderStyle.solid),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Panduan Foto KTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 125,
                            height: 90,
                            color: Colors.white,
                            child: Center(
                              child: Stack(children: [
                                Image.asset('assets/images/ktp1.png'),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.done_outline,
                                    color: Colors.green[400],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            width: 125,
                            height: 90,
                            color: Colors.white,
                            child: Center(
                              child: Stack(children: [
                                Image.asset('assets/images/ktp2.png'),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.close_outlined,
                                    color: Colors.red[400],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "E-KTP asli",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Tidak blur atau buram",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Foto E-KTP tidak terpotong",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "E-KTP tidak rusak",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              // Chose img button
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                        style: BorderStyle.solid)),
                child: Text(
                  'Choose your...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF006466))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AjukanPage()),
                    );
                  },
                  child: Text('Selanjutnya'))
            ],
          ),
        ),
      ),
    );
  }
}
