import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var list = ["", "", "", "", "", "", "", "", ""];
  bool player1 = true;
  int filledBoxes = 0;
  int player1Scrore = 0;
  int player2Scrore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text('PLAYER X',
                            style: GoogleFonts.blackOpsOne(
                                textStyle: const TextStyle(fontSize: 30))),
                        Text(player2Scrore.toString(),
                            style: GoogleFonts.blackOpsOne(
                                textStyle: const TextStyle(fontSize: 40))),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text('PLAYER O',
                            style: GoogleFonts.blackOpsOne(
                                textStyle: const TextStyle(fontSize: 30))),
                        Text(player1Scrore.toString(),
                            style: GoogleFonts.blackOpsOne(
                                textStyle: const TextStyle(fontSize: 40))),
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      handleTap(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 0.5,
                      )),
                      padding: const EdgeInsets.all(16),
                      child: Center(
                          child: Text(list[index].toString(),
                              style: const TextStyle(fontSize: 40))),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'TIC TAC TOE',
                style: GoogleFonts.blackOpsOne(
                    textStyle: const TextStyle(fontSize: 40)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleTap(int index) {
    setState(() {
      if (player1 && list[index] == "") {
        list[index] = "O";
        player1 = !player1;
        filledBoxes += 1;
      } else if (list[index] == "") {
        list[index] = "X";
        player1 = !player1;
        filledBoxes += 1;
      }
      checkWinner();
    });
  }

  checkWinner() {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != "") {
      showModal(list[0].toString());
    } else if (list[3] == list[4] && list[3] == list[5] && list[3] != "") {
      showModal(list[3].toString());
    } else if (list[6] == list[7] && list[6] == list[8] && list[6] != "") {
      showModal(list[6].toString());
    } else if (list[0] == list[3] && list[0] == list[6] && list[0] != "") {
      showModal(list[0].toString());
    } else if (list[1] == list[4] && list[1] == list[7] && list[1] != "") {
      showModal(list[1].toString());
    } else if (list[2] == list[5] && list[2] == list[8] && list[2] != "") {
      showModal(list[2].toString());
    } else if (list[0] == list[4] && list[0] == list[8] && list[0] != "") {
      showModal(list[0].toString());
    } else if (list[2] == list[4] && list[2] == list[6] && list[2] != "") {
      showModal(list[2].toString());
    } else if (filledBoxes == 9) {
      showModal("", "Draw !!!");
    }
  }

  void showModal(String string, [String? msg]) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(50),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: Text(
            msg ?? "Winner : $string",
            style: GoogleFonts.blackOpsOne(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black)),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                  clearBoard();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.black
                  ),
                  child: Text(
                    "Play Again !",
                    style: GoogleFonts.blackOpsOne(
                        textStyle:
                            const TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ))
          ],
        );
      },
    );
    if (string == "O") {
      setState(() {
        player1Scrore += 1;
      });
    } else if (string == "X") {
      setState(() {
        player2Scrore += 1;
      });
    }
  }

  void clearBoard() {
    for (int i = 0; i < list.length; i++) {
      setState(() {
        list[i] = "";
      });
    }
    filledBoxes = 0;
  }
}
