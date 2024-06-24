import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/quiz/quiz_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class NumQuestionScreen extends StatefulWidget {
  static const String routeName = '/pick_questions';

  const NumQuestionScreen({super.key});

  @override
  _NumQuestionScreenState createState() => _NumQuestionScreenState();
}

class _NumQuestionScreenState extends State<NumQuestionScreen> {
  int _selectedQuestions = 10;

  final List<int> questionCounts = [10, 20, 30, 40, 50];

  void _selectQuestions(int count) {
    setState(() {
      _selectedQuestions = count;
    });
  }

  void _submitSelection() {
    Navigator.pushNamed(
      context,
      QuizScreen.routeName,
      arguments: {"questionsNum": _selectedQuestions},
    );
  }

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
                color: scheme.secondary,
                fontSize: 32,
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: Text(
              'Determine the number of',
              style: GoogleFonts.rubikWetPaint(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 220,
            child: Text(
              'questions:',
              style: GoogleFonts.rubikWetPaint(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 315,
            child: Column(
              children: questionCounts.map((count) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => _selectQuestions(count),
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _selectedQuestions == count
                            ? scheme.primary
                            : scheme.primary.withOpacity(0.2),
                        border: Border.all(color: scheme.primary),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          '$count',
                          style: GoogleFonts.rubikWetPaint(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: 30,
            child: GestureDetector(
              onTap: _submitSelection,
              child: SvgPicture.asset('assets/images/btn.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
