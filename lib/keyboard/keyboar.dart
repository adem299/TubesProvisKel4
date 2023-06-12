import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class CustomKeyboard extends StatefulWidget {
  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();

    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['000', '0', Icon(Icons.keyboard_backspace)],
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

  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackspacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
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
              bottom: 8.0), // Menambahkan jarak di bagian bawah tulisan
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: amount.length > 0 ? Color(0xFF5B5B5F) : Colors.grey,
                width: 3.0, // Membuat garis bawah lebih tebal
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            renderAmount(),
            ...renderKeyboard(),
            renderConfirmButton(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
