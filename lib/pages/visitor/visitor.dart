import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:lendyv1/pages/borrower/start/login_page.dart';

class VisitrPage1 extends StatefulWidget {
  const VisitrPage1({Key? key}) : super(key: key);

  @override
  _VisitrPage1State createState() => _VisitrPage1State();
}

class _VisitrPage1State extends State<VisitrPage1> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastSlide = false;
  bool lastSlide = false;
  bool _isFirstPage = false;

  final List<Map<String, dynamic>> page2 = [
    {
      'title': 'Proses Cepat',
      'image': 'assets/images/proses.png',
      'caption':
          'Kemudahan untuk transaksi, kirim uang, pembelian pulsa, bayar tagihan dan transaksi e-commerce',
    },
    {
      'title': 'Bunga Rendah',
      'image': 'assets/images/bunga.png',
      'caption':
          'Lendy dibangun dengan teknologi keamanan kelas dunia dengan sistem jaringan yang diawasi 24 jam',
    },
    {
      'title': 'Keamanan Peminjam Terjamin',
      'image': 'assets/images/keamanan.png',
      'caption': 'Lendy menjamin 100% keamanan dengan garansi uang kembali',
    },
  ];
  int _selectedIndex = -1;
  final List<String> onboardingTitles = [
    'Keuangan Digital Anda',
    'Transaksi Dengan Aman & Nyaman',
    'Investor',
    'Peminjam',
  ];
  final List<String> privasiPeminjam = [
    '1.Pastikan Anda telah mengisi profil data pribadi dan profil bisnis Anda di halaman profil aplikasi. Selain itu, buatlah PIN yang akan digunakan untuk proses finalisasi pinjaman.',
    '2.Setelah selesai mengisi data, anda bisa klik navigator "ajukan" yang nantinya akan menampilkan halaman pinjaman.',
    '3.Di halaman pengajuan pinjaman, lengkapi beberapa form yang tersedia dengan informasi yang diminta.',
    '4.Jika dirasa data-data Anda sudah benar,anda bisa langsung klik tombol “Selanjutnya”.',
    '5.Aplikasi akan menampilkan kembali data yang telah Anda isi untuk diverifikasi. Periksa kembali data tersebut.',
    '6.Jika dirasa semua data sudah benar,klik tombol "Ajukan Pinjaman".',
    '7.Selanjutnya aplikasi Akan memumunculkan peringatan berupa pop-up untuk memastikan bahwa kamu benar-benar yakin untuk meminjam uang tersebut.',
    '8.Jika Anda sudah yakin, klik tombol "Lanjut".',
    '9.Masukkan PIN yang telah Anda buat sebelumnya.',
    '10.Pinjaman Anda berhasil diajukan dan akan diproses.',
    '11.Buka halaman aktivitas untuk melihat status pinjaman Anda. Awalnya, statusnya akan menjadi "Menunggu".',
    '12.Tunggu hingga seorang investor menyetujui dan dapat mendanai pinjaman yang Anda ajukan.',
    '13.Jika ada seorang investor yang dapat mendanai pinjaman Anda, maka status pinjaman anda akan berubah menjadi "Didanai", dan uang akan secara otomatis masuk ke saldo rekening Anda.',
    '14.Setelah uang masuk ke rekening, Anda dapat menggunakannya sesuai kebutuhan.',
    '15.Jangan lupa untuk membayar pinjaman sesuai dengan tenggat waktu yang telah disepakati.',
  ];
  final List<String> privasiInvestor = [
    '1.Pastikan Anda telah melengkapi profil data pribadi dan bisnis Anda dengan lengkap di halaman profil aplikasi. Selain itu, buatlah PIN yang akan digunakan saat proses finalisasi pinjaman.',
    '2.Setelah selesai mengisi data, kliklah pada menu "Pendanaan" di navigator. Halaman ini akan menampilkan opsi untuk memulai proses pendanaan.',
    '3.Di halaman pengajuan pendanaan, Anda dapat memilih dari berbagai pengajuan pinjaman yang tersedia.',
    '4.Setelah memilih, sistem akan menampilkan detail pinjaman dalam sebuah pop-up. Jika Anda setuju dengan detail yang diajukan, Anda dapat melanjutkan proses pendanaan dengan mengklik opsi "Terima Pinjaman".',
    '5.Aplikasi akan menampilkan kembali data yang telah Anda isi untuk diverifikasi. Mohon periksa kembali data tersebut dengan seksama.',
    '6.Jika semua data telah diverifikasi dengan benar, klik tombol "Ajukan Pinjaman".',
    '7.Selanjutnya, masukkan PIN yang telah Anda buat sebelumnya.',
    '8.Pendanaan Anda telah berhasil diajukan dan akan segera diproses.',
  ];

  final List<String> onboardingDescriptions = [
    'Optimalkan Potensi Keuangan Anda dengan Lendy, Mitra Pembiayaan Terpercaya Anda.',
    '',
    'Turut menjadi bagian dari pemberdayaan UMKM dengan menjadi investor di Lendy',
    'Temukan solusi modal kerja penuh manfaat dengan menjadi peminjam di Lendy',
  ];

  final List<Widget> onboardingImages = [
    Image.asset('assets/images/visitor1.png'),
    Image.asset(''),
    Image.asset('assets/images/investor.png'),
    Image.asset('assets/images/peminjam.png'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void showBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomSheetHeight = screenHeight * 14 / 15;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        // color: Colors.grey,
      ),
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2, // Jumlah tab
          child: Container(
            height: bottomSheetHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF71E7E5),
                  Color(0xFFBA88E2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), // Ubah ukuran ujung atas
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    _currentPage == 2 ? 'Pendanaan' : 'Pinjaman',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Container(
                      height: 3.0,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _currentPage == 2
                      ? privasiInvestor.length
                      : privasiPeminjam.length,
                  itemBuilder: (context, index) {
                    String privacyText = _currentPage == 2
                        ? privasiInvestor[index]
                        : privasiPeminjam[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            privacyText,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.black, // Ubah background menjadi warna hitam
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/logo/logo.png'),
                      width: 70,
                    ),
                    Container(
                      child: VerticalDivider(color: Colors.white),
                      margin: EdgeInsets.symmetric(vertical: 12),
                    ),
                    _currentPage == 0
                        ? SizedBox()
                        : Row(
                            children: [
                              _currentPage == 1
                                  ? SizedBox()
                                  : TextButton(
                                      onPressed: () {
                                        showBottomSheet(context);
                                      },
                                      child: Text(
                                        "Privasi",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                              SizedBox(
                                width: 12,
                              ),
                              _currentPage == onboardingTitles.length - 1
                                  ? SizedBox()
                                  : TextButton(
                                      onPressed: () {
                                        // Tambahkan kode aksi yang ingin Anda jalankan saat tombol ditekan
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Masuk",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    )
                            ],
                          ) // Jika _currentPage bukan 0, kembalikan SizedBox kosong
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: screenHeight * 0.7,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingTitles.length,
                        itemBuilder: (context, index) {
                          _isLastSlide = index == onboardingTitles.length - 1;
                          _isFirstPage = index == 0;
                          if (_currentPage == 0) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    width: screenWidth * 0.8,
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Opacity(
                                          opacity:
                                              0.4, // Set the opacity level here (0.0 to 1.0)
                                          child: onboardingImages[index],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 40),
                                            Container(
                                              width: screenWidth * 0.8,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  onboardingTitles[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: Text(
                                                onboardingDescriptions[index],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFFC6C6C6),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else if (_currentPage == 1) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: Text(
                                      onboardingTitles[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: page2.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Image(
                                          image:
                                              AssetImage(page2[index]['image']),
                                          width: 100,
                                        ),
                                        Text(
                                          page2[index]['title'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 17,
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            page2[index]['caption'],
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  211, 255, 255, 255),
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.5,
                                  child: onboardingImages[index],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  onboardingTitles[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                SizedBox(height: 27),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    onboardingDescriptions[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _isLastSlide || _currentPage == 0
                        ? Container(
                            width: 0.7 * screenWidth,
                            height: 57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF71E7E5),
                                  Color(0xFFBA88E2),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                if (_isLastSlide) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                } else {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                }
                              },
                              child: Text(
                                _isLastSlide
                                    ? 'Daftar Sekarang'
                                    : 'Mulai Sekarang',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        : Container(
                            width: 0.7 * screenWidth,
                            height: 57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF0A0A0A),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _pageController.previousPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        icon: Icon(Icons.arrow_back_rounded),
                                        iconSize: 24,
                                        color: Color(0xFF71E7E5),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: VerticalDivider(
                                    color: Color(0xFF71E7E5),
                                    thickness: 2,
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        icon: Icon(Icons.arrow_forward_rounded),
                                        iconSize: 24,
                                        color: Color(0xFF71E7E5),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < onboardingTitles.length; i++) {
      indicators.add(_indicator(i == _currentPage));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 30.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF71E7E5) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
