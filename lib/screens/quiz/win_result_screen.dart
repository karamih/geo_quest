import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WinResultScreen extends StatelessWidget {
  static const String routeName = '/win_result_screen';

  const WinResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>?;

    final int questionsCorrectness = args?['questionsCorrectness'] ?? 0;
    final int questionsNum = args?['questionsNum'] ?? 0;

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
            child: SvgPicture.asset(
              'assets/images/flags.svg',
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            top: 80,
            bottom: 40,
            child: Container(
              color: scheme.surface.withOpacity(0.8),
            ),
          ),
          Positioned(
            top: 115,
            child: SvgPicture.asset(
              'assets/images/onb4.svg',
              color: scheme.secondary,
            ),
          ),
          Positioned(
            top: 370,
            child: Text(
              'Good!',
              style: GoogleFonts.rubikWetPaint(
                color: Colors.white,
                fontSize: 32,
                shadows: [
                  Shadow(
                    color: scheme.secondary,
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 430,
            child: Text(
              'Your Correct',
              style: GoogleFonts.rubikWetPaint(
                  color: scheme.secondary,
                  fontSize: 24,
                  shadows: [
                    const Shadow(
                        offset: Offset(-1.5, -1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(1.5, -1.5), color: Colors.white),
                    const Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(-1.5, 1.5), color: Colors.white),
                  ]),
            ),
          ),
          Positioned(
            top: 460,
            child: Text(
              'answers:',
              style: GoogleFonts.rubikWetPaint(
                  color: scheme.secondary,
                  fontSize: 24,
                  shadows: [
                    const Shadow(
                        offset: Offset(-1.5, -1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(1.5, -1.5), color: Colors.white),
                    const Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(-1.5, 1.5), color: Colors.white),
                  ]),
            ),
          ),
          Positioned(
            top: 490,
            child: Text(
              '$questionsCorrectness/$questionsNum',
              style: GoogleFonts.rubikWetPaint(
                  color: scheme.secondary,
                  fontSize: 24,
                  shadows: [
                    const Shadow(
                        offset: Offset(-1.5, -1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(1.5, -1.5), color: Colors.white),
                    const Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                    const Shadow(
                        offset: Offset(-1.5, 1.5), color: Colors.white),
                  ]),
            ),
          ),
          Positioned(
            bottom: 140,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, PlayScreen.routeName);
              },
              child: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: scheme.secondary,
                ),
                child: Center(
                  child: Text(
                    'Retry',
                    style: GoogleFonts.rubikWetPaint(
                      color: const Color(0xffF5F5F5),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
