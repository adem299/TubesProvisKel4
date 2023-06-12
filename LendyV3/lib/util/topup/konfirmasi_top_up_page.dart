import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lendyv1/pages/borrower/main/ajukan_page.dart';
import 'package:lendyv1/pages/borrower/home_page.dart';
import 'package:get/get.dart';
import 'package:lendyv1/pages/borrower/main/pin_page.dart';

class KonfirmasiTopUpPage extends StatefulWidget {
  const KonfirmasiTopUpPage({Key? key});

  @override
  State<KonfirmasiTopUpPage> createState() => _KonfirmasiTopUpPageState();
}

class _KonfirmasiTopUpPageState extends State<KonfirmasiTopUpPage> {
  TextEditingController paymentController = TextEditingController();
  List<Map<String, dynamic>> _options = [
    {
      'title': 'Indomaret',
      'color': Colors.black,
      'image': 'assets/images/indomaret.png',
      'caption':
          'Tunjukkan barcode ke kasir, lalu bayar jumlah top up dengan uang tunai.',
    },
    {
      'title': 'Alfamart',
      'color': Colors.black,
      'image': 'assets/images/alfamart.png',
      'caption':
          'Tunjukkan barcode ke kasir, lalu bayar jumlah top up dengan uang tunai.',
    },
  ];
  int _selectedIndex = -1;
  @override
  void initState() {
    super.initState();
  }

  void showBottomSheet(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomSheetHeight = screenHeight * 8 / 9;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        // color: Colors.grey,
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DefaultTabController(
              length: 2, // Jumlah tab
              child: Container(
                height: bottomSheetHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Pilih Metode Pembayaran',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Metode top up',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Pilih metode untuk top up',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      child: ListView.builder(
                        itemCount: _options.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            child: ClipOval(
                                              child: Image.asset(
                                                _options[index]['image'],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    _options[index]['title'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    _options[index]['caption'],
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Radio<int>(
                                        value: index,
                                        groupValue: _selectedIndex,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedIndex = value!;
                                            Navigator.pop(context);
                                            _updateBottomNavbarText();
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Divider(
                                        height: 1,
                                        thickness: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _updateBottomNavbarText() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor =
        _selectedIndex != -1 ? _options[_selectedIndex]['color'] : Colors.red;
    String _selectedOptionText = _selectedIndex != -1
        ? _options[_selectedIndex]['title']
        : "Pilih metode top up";

    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Top Up'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jumlah top up",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF5B5B5F),
              ),
            ), // Tambahkan koma di sini
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12),
              child: Text(
                "Rp5.000.000",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Rincian top up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B5B5F),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jumlah top up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF5B5B5F),
                  ),
                ),
                Text(
                  "Rp5.000.000",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Biaya top up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF5B5B5F),
                  ),
                ),
                Text(
                  "Rp2.000",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF5B5B5F),
                  ),
                ),
                Text(
                  "Rp5.002.000",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      _selectedIndex != -1
                          ? Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  _options[_selectedIndex]['image'],
                                ),
                              ),
                            )
                          : Icon(
                              Icons.remove_circle_outline_outlined,
                              size: 20,
                              color: Colors.red,
                            ),
                      SizedBox(width: 8.0),
                      Text(
                        _selectedOptionText,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: selectedColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showBottomSheet(context);
                    },
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 85, 84, 84),
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(300, 50), // Atur panjang dan lebar tombol di sini
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Atur radius border circular di sini
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => App(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        "Kofirmasi top up",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rp5.002.000",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_circle_right,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
