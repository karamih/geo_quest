import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseOnboard extends StatelessWidget {
  final String imgPath;
  final String title1;
  final String title2;
  final String description;
  PageController controller;

  BaseOnboard(
      {super.key,
      required this.controller,
      required this.imgPath,
      required this.title1,
      required this.title2,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(top: 70, left: 40, child: SvgPicture.asset(imgPath)),
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
                      title1,
                      style: GoogleFonts.rubikWetPaint(
                          color: scheme.secondary, fontSize: 26),
                    ),
                    Text(
                      title2,
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
