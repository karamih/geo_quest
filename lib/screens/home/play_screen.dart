import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/home/how_to_play_screen.dart';
import 'package:geo_quest/screens/home/num_question_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayScreen extends StatelessWidget {
  static const String routeName = '/play_screen';

  const PlayScreen({super.key});

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
              )),
          Positioned(
              top: 120,
              child: Text(
                'GeoQuest',
                style: GoogleFonts.rubikWetPaint(
                    color: scheme.secondary, fontSize: 48),
              )),
          Positioned(
              top: 230, child: SvgPicture.asset('assets/images/onb4.svg')),
          Positioned(
              bottom: 140,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NumQuestionScreen.routeName);
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: scheme.primary),
                    child: Center(
                      child: Text(
                        'Play',
                        style: GoogleFonts.rubikWetPaint(
                            color: const Color(0xffF5F5F5), fontSize: 20),
                      ),
                    ),
                  ))),
          Positioned(
              bottom: 90,
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HowToPlayScreen.routeName);
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: scheme.primary),
                    child: Center(
                      child: Text(
                        'How to Play',
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
