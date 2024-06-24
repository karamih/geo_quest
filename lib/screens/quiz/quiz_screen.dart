import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/config/questions.dart';
import 'package:geo_quest/screens/quiz/congratulation_screen.dart';
import 'package:geo_quest/screens/quiz/lose_result_screen.dart';
import 'package:geo_quest/screens/quiz/win_result_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/quiz_screen';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int questionIndex;
  int questionCounter = 0;
  int questionsCorrectness = 0;
  int questionsWrongness = 0;
  late int questionsNum;

  @override
  void initState() {
    super.initState();
    questionIndex = Random().nextInt(questions.length);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      questionsNum = args['questionsNum'];
    }
  }

  void validate(int choice) {
    Future.delayed(const Duration(microseconds: 800), () {
      if (choice == questions[questionIndex]["answer"]) {
        setState(() {
          questionsCorrectness++;
        });
      } else {
        setState(() {
          questionsWrongness++;
        });
      }
      questionCounter++;
      if (questionCounter == questionsNum) {
        if (questionsCorrectness == questionsNum) {
          Navigator.pushReplacementNamed(
              context, CongratulationScreen.routeName);
        } else if (questionsCorrectness >= questionsNum / 2.round()) {
          Navigator.pushReplacementNamed(context, WinResultScreen.routeName,
              arguments: {
                "questionsCorrectness": questionsCorrectness,
                "questionsNum": questionsNum
              });
        } else {
          Navigator.pushReplacementNamed(context, LoseResultScreen.routeName,
              arguments: {
                "questionsCorrectness": questionsCorrectness,
                "questionsNum": questionsNum
              });
        }
      } else {
        questionIndex = Random().nextInt(questions.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    double progress = questionCounter / questionsNum;

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
              'assets/images/halfflags.png',
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
            top: 150,
            right: 30,
            left: 30,
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              decoration: BoxDecoration(
                color: scheme.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: scheme.secondary, width: 5),
              ),
              child: Center(
                child: Text(
                  questions[questionIndex]["questions"],
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
            top: 360,
            child: Text(
              'Question number $questionCounter/$questionsNum',
              style: GoogleFonts.rubikWetPaint(
                  fontSize: 16, color: scheme.primary, letterSpacing: 0.25),
            ),
          ),
          Positioned(
            top: 390,
            right: 30,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: scheme.primary, width: 1.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: scheme.tertiary,
                valueColor: AlwaysStoppedAnimation<Color>(scheme.secondary),
                minHeight: 10,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned(
            top: 450,
            // left: 0,
            // right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => validate(0),
                      child: SvgPicture.asset(
                          'assets/countries/unselected/${questions[questionIndex]["options"][0]}.svg'),
                    ),
                    GestureDetector(
                      onTap: () => validate(1),
                      child: SvgPicture.asset(
                          'assets/countries/unselected/${questions[questionIndex]["options"][1]}.svg'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => validate(2),
                      child: SvgPicture.asset(
                          'assets/countries/unselected/${questions[questionIndex]["options"][2]}.svg'),
                    ),
                    GestureDetector(
                      onTap: () => validate(3),
                      child: SvgPicture.asset(
                          'assets/countries/unselected/${questions[questionIndex]["options"][3]}.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
