import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                child: Text(
                  '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
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
