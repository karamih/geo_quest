import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
        upperBound: double.infinity,
        lowerBound: 100);
    _simulation = SpringSimulation(
        const SpringDescription(mass: 0.5, stiffness: 100, damping: 10),
        0,
        300,
        0);
    _controller.animateWith(_simulation);

    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

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
              )), // Animated logo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double centerX = width / 2 - 200;
                return Transform.translate(
                  offset: Offset(centerX, _controller.value),
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 200,
                    height: 220,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
