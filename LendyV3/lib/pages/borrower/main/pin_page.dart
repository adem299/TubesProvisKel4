import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lendyv1/pages/borrower/main/succes_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var inputText = "";
  var actives = [false, false, false, false, false, false];
  var clears = [false, false, false, false, false, false];
  var values = [1, 2, 3, 3, 2, 1];
  var currentIndex = 0;
  var message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Masukkan PIN",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < actives.length; i++)
                        AnimationBox(
                          clear: clears[i],
                          active: actives[i],
                          value: values[i],
                        ),
                    ],
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    // color: Colors.white,
                    color: message == "Success" ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8 / 0.6,
              ),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(4.0),
                width: 50,
                height: 50,
                child: index == 9
                    ? SizedBox()
                    : Center(
                        child: MaterialButton(
                          onPressed: () {
                            if (index == 11) {
                              inputText =
                                  inputText.substring(0, inputText.length - 1);
                              clears = clears.map((e) => false).toList();
                              // titik titik itu nanti akan berjalan ketika diisi
                              currentIndex--;
                              if (currentIndex >= 0)
                                setState(() {
                                  clears[currentIndex] = true;
                                  actives[currentIndex] = false;
                                });
                              else {
                                currentIndex = 0;
                              }
                              return;
                            } else
                              inputText +=
                                  numbers[index == 10 ? index - 1 : index]
                                      .toString();
                            if (inputText.length == 6) {
                              setState(() {
                                clears = clears.map((e) => true).toList();
                                actives = clears.map((e) => false).toList();
                              });
                              if (inputText == "123456") {
                                //go to next screen
                                setState(() {
                                  message = "Success";
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const SuccessPage(),
                                    ),
                                  );
                                });
                              } else {
                                setState(() {
                                  message = "Forgot password?";
                                });
                              }
                              inputText = "";
                              currentIndex = 0;
                              return;
                            }
                            message = "";
                            clears = clears.map((e) => false).toList();
                            // titik titik itu nanti akan berjalan ketika diisi
                            setState(() {
                              actives[currentIndex] = true;
                              currentIndex++;
                            });
                          },
                          // color: Colors.white30,
                          minWidth: 55,
                          height: 55,
                          child: index == 11
                              ? Icon(
                                  Icons.backspace,
                                  color: Colors.white,
                                )
                              : Text(
                                  "${numbers[index == 10 ? index - 1 : index]}",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.white,
                                  ),
                                ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                        ),
                      ),
              ),
              itemCount: 12,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class AnimationBox extends StatefulWidget {
  final clear;
  final active;
  final value;

  const AnimationBox({
    Key? key,
    this.clear = false,
    this.active = false,
    this.value,
  }) : super(key: key);

  @override
  State<AnimationBox> createState() => _AnimationBoxState();
}

class _AnimationBoxState extends State<AnimationBox>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.clear) {
      animationController.forward(from: 0);
    }
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Container(
        margin: EdgeInsets.all(8),
        // color: Colors.red,
        child: Stack(
          children: [
            Container(),
            AnimatedContainer(
              duration: Duration(milliseconds: 800),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.active ? Colors.white : Colors.white24,
              ),
            ),
            Align(
              alignment:
                  Alignment(0, animationController.value / widget.value - 1),
              child: Opacity(
                opacity: 1 - animationController.value,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.active ? Colors.white : Colors.white24,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
