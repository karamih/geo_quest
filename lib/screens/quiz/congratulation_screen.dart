import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationScreen extends StatelessWidget {
  static const String routeName = '/congratulation_screen';

  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.tertiary,
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
                color: scheme.tertiary.withOpacity(0.85),
              )),
          Positioned(
              top: 120,
              child: SvgPicture.asset(
                'assets/images/congratulation.svg',
              )),
          Positioned(
              top: 390,
              child: Text(
                'Your Answered All',
                style: GoogleFonts.rubikWetPaint(
                    color: scheme.secondary,
                    fontSize: 24,
                    shadows: [
                      const Shadow(
                          offset: Offset(-1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, 1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(-1.5, 1.5), color: Colors.white),
                    ]),
              )),
          Positioned(
              top: 420,
              child: Text(
                'The Questions',
                style: GoogleFonts.rubikWetPaint(
                    color: scheme.secondary,
                    fontSize: 24,
                    shadows: [
                      const Shadow(
                          offset: Offset(-1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, 1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(-1.5, 1.5), color: Colors.white),
                    ]),
              )),
          Positioned(
              top: 450,
              child: Text(
                'Correctly',
                style: GoogleFonts.rubikWetPaint(
                    color: scheme.secondary,
                    fontSize: 24,
                    shadows: [
                      const Shadow(
                          offset: Offset(-1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, -1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(1.5, 1.5), color: Colors.white),
                      const Shadow(
                          offset: Offset(-1.5, 1.5), color: Colors.white),
                    ]),
              )),
          Positioned(
              bottom: 140,
              child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, PlayScreen.routeName);
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: scheme.secondary),
                    child: Center(
                      child: Text(
                        'Retry',
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
