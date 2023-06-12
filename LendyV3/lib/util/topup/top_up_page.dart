import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lendyv1/util/Color/ColorCustom.dart';
import 'package:lendyv1/util/topup/konfirmasi_top_up_page.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  KeyboardKey({
    @required this.label,
    @required this.value,
    required this.onTap,
  });

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is Widget) {
      return widget.label;
    }

    return Text(
      widget.label,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          child: Center(
            child: renderLabel(),
          ),
        ),
      ),
    );
  }
}

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool isFilterVisible = false;
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();
    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['00', '0', Icon(Icons.backspace)],
    ];

    amount = '';
  }

  onKeyTap(val) {
    if (val == '0' && amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount + val;
    });
  }

  onBackspacePress() {
    if (amount.length == 0) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderAmount() {
    String display = 'Rp 0';
    TextStyle style = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    if (this.amount.length > 0) {
      NumberFormat f = NumberFormat('#,###');

      display = 'Rp ' + f.format(int.parse(amount));
      style = style.copyWith(
        color: Color(0xFF5B5B5F),
      );
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.only(
            bottom: 8.0,
          ), // Menambahkan jarak di bagian bawah tulisan
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: amount.length > 0 ? Color(0xFF5B5B5F) : Colors.grey,
                width: 1.0, // Membuat garis bawah lebih tebal
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  display,
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderConfirmButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.blue;
                  },
                ),
              ),
              onPressed: amount.length > 0 ? () {} : null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Lanjut',
                  style: TextStyle(
                    color: amount.length > 0 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    List amounts = [
      "20.000",
      "50.000",
      "100.000",
      "300.000",
      "500.000",
      "1.000.000"
    ];
    TextEditingController textController = TextEditingController(text: 'Rp ');
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
        backgroundColor: AppColors.bgColor,
      ),
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 25.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Pilih nominal",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++) buildContainer(amounts[i]),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 3; i < amounts.length; i++)
                          buildContainer(amounts[i]),
                      ],
                    ),
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            double screenHeight =
                                MediaQuery.of(context).size.height;
                            double bottomSheetHeight = screenHeight * 14 / 15;
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30)),
                              ),
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Container(
                                      height: bottomSheetHeight,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular((30.0)),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Container(
                                                  height: 5.0,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[350],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (30.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Masukkan jumlah top up",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFF5B5B5F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SafeArea(
                                              child: Column(
                                                children: [
                                                  renderAmount(),
                                                  SizedBox(
                                                    height: bottomSheetHeight *
                                                        1 /
                                                        4, // Contoh penggunaan MediaQuery
                                                  ),
                                                  Container(
                                                    height: 8.0,
                                                    color: Colors.grey[300],
                                                  ),
                                                  ...keys.map((x) {
                                                    return Row(
                                                      children: x.map(
                                                        (y) {
                                                          return Expanded(
                                                            child: KeyboardKey(
                                                              label: y is Icon
                                                                  ? y
                                                                  : y.toString(),
                                                              value: y,
                                                              onTap: (val) {
                                                                if (val
                                                                    is Icon) {
                                                                  onBackspacePress();
                                                                } else {
                                                                  onKeyTap(val);
                                                                }
                                                                setState(() {});
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                    );
                                                  }).toList(),
                                                  renderConfirmButton(),
                                                  SizedBox(
                                                    height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height *
                                                        0.04, // Contoh penggunaan MediaQuery
                                                  )
                                                ],
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
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                size: 18,
                                color: Colors.grey[700],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Masukkan Nominal"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.starColor),
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(
                              300, 50), // Atur panjang dan lebar tombol di sini
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Atur radius border circular di sini
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => KonfirmasiTopUpPage(),
                          ),
                        );
                      },
                      child: Text("Lanjut"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String amount) {
    bool isHovered = false;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: () {
          setState(() {
            this.amount = amount;
          });
          print("Tombol diklik! Jumlah: Rp$amount");
          // Tambahkan fungsi atau perintah lain yang diinginkan di sini
        },
        child: Material(
          elevation: isHovered ? 10 : 7,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: isHovered ? Colors.grey[400] : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.money,
                  size: 18,
                  color: Colors.green[700],
                ),
                SizedBox(height: 5),
                Text(
                  "Rp$amount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TopUpPage(),
  ));
}
