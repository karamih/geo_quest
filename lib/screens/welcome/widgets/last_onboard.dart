import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LastOnboard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;

  const LastOnboard(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 120,
              child: Text(
                'GeoQuest',
                style: GoogleFonts.rubikWetPaint(
                    color: scheme.secondary, fontSize: 48),
              )),
          Positioned(top: 230, child: SvgPicture.asset(imgPath)),
          Positioned(
              top: 490,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.rubikWetPaint(
                          color: scheme.secondary, fontSize: 26),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.rubikWetPaint(
                          color: scheme.primary,
                          fontSize: 14,
                          height: 2,
                          wordSpacing: 3),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
