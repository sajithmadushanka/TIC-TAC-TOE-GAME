import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> displayEx = ['', '', '', '', '', '', '', '', ''];
  bool bl = true;

  int oscore = 0;
  int xscore = 0;

  var textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  _tapped(int index) {
    setState(() {
      if (bl && displayEx[index] == '') {
        displayEx[index] = 'o';
        bl = !bl;
      } else if (displayEx[index] == '') {
        displayEx[index] = 'x';
        bl = !bl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Player O',
                              style: textStyle,
                            ),
                          ),
                          Text(
                            oscore.toString(),
                            style: textStyle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'player X',
                              style: textStyle,
                            ),
                          ),
                          Text(
                            xscore.toString(),
                            style: textStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                      winner(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                        // color: Colors.grey[800],
                      ),
                      child: Center(
                        child: Text(
                          displayEx[index],
                          style: const TextStyle(
                              fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          Expanded(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('TIC TAC TOE', style: textStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('@CreatedBySajith', style: textStyle),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  void winner(index) {
    //row 1
    if (displayEx[0] == displayEx[1] &&
        displayEx[0] == displayEx[2] &&
        displayEx[0] != '') {
      showdialog(context, displayEx[0]);
    }
    // row 2
    if (displayEx[3] == displayEx[4] &&
        displayEx[3] == displayEx[5] &&
        displayEx[3] != '') {
      showdialog(context, displayEx[3]);
    }
    if (displayEx[6] == displayEx[7] &&
        displayEx[6] == displayEx[8] &&
        displayEx[6] != '') {
      showdialog(context, displayEx[6]);
    }
    // col 1
    if (displayEx[0] == displayEx[3] &&
        displayEx[0] == displayEx[6] &&
        displayEx[0] != '') {
      showdialog(context, displayEx[0]);
    }
    // col 2
    if (displayEx[1] == displayEx[4] &&
        displayEx[1] == displayEx[7] &&
        displayEx[1] != '') {
      showdialog(context, displayEx[1]);
    }
    // col 3
    if (displayEx[2] == displayEx[5] &&
        displayEx[2] == displayEx[8] &&
        displayEx[2] != '') {
      showdialog(context, displayEx[3]);
    }
    // diagonal 1
    if (displayEx[0] == displayEx[4] &&
        displayEx[0] == displayEx[8] &&
        displayEx[0] != '') {
      showdialog(context, displayEx[0]);
    }
    // diagonal 2
    if (displayEx[2] == displayEx[4] &&
        displayEx[2] == displayEx[6] &&
        displayEx[2] != '') {
      showdialog(context, displayEx[2]);
    }
  }

  // show dailog box--------------------
  showdialog(context, String winnerName) {
    setState(() {
      if (winnerName == 'o') oscore++;
      if (winnerName == 'x') xscore++;
    });
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Winner is player $winnerName'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _resetBoard();
              },
              child: const Text('play again'),
            )
          ],
        );
      },
    );
  }

  void _resetBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayEx[i] = '';
      }
    });
  }
}
