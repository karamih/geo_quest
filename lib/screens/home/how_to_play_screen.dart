import 'package:flutter/material.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToPlayScreen extends StatelessWidget {
  static const String routeName = '/how_to_play_Screen';

  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left: 30,
            right: 30,
            top: 80,
            bottom: 40,
            child: Image.asset(
              'assets/images/flags.png',
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 80,
            bottom: 40,
            child: Container(
              color: scheme.surface.withOpacity(0.85),
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: Text(
              'GeoQuest',
              style: GoogleFonts.rubikWetPaint(
                color: scheme.primary,
                fontSize: 32,
              ),
            ),
          ),
          Positioned(
            top: 170,
            right: 30,
            left: 30,
            child: Container(
              height: 540,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                color: scheme.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: scheme.secondary, width: 5),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'How To Play',
                      style: GoogleFonts.rubikWetPaint(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        "To start the game, you have to choose the number of questions. After the desired number of questions is determined, the game starts.Answer the questions in order and carefully so that you can get three stars.Otherwise, the number of correct questions will be determined and you can resume the same game and questions and correct your mistakes!",
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          color: Colors.white,height: 3
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 140,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PlayScreen.routeName);
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: scheme.primary),
                    child: Center(
                      child: Text(
                        'OK',
                        style: GoogleFonts.rubikWetPaint(
                            color: const Color(0xffF5F5F5), fontSize: 20),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
