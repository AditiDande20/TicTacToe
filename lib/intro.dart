import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text("TIC TAC TOE",
                  style: GoogleFonts.blackOpsOne(
                      textStyle: const TextStyle(fontSize: 40))),
            ),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                glowColor: Colors.black,
                endRadius: 140.0,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                shape: BoxShape.circle,
                startDelay: const Duration(seconds: 1),
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none)),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 90.0,
                    child: Image.asset(
                      'assets/images/tic.png',
                      height: 200,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const GameScreen();
                      },
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("PLAY GAME",
                        style: GoogleFonts.blackOpsOne(
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.black))),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
