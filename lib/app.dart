import 'package:flutter/material.dart';
import 'package:geo_quest/config/my_theme.dart';
import 'package:geo_quest/screens/home/how_to_play_screen.dart';
import 'package:geo_quest/screens/home/num_question_screen.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:geo_quest/screens/quiz/congratulation_screen.dart';
import 'package:geo_quest/screens/quiz/lose_result_screen.dart';
import 'package:geo_quest/screens/quiz/quiz_screen.dart';
import 'package:geo_quest/screens/quiz/win_result_screen.dart';
import 'package:geo_quest/screens/welcome/splash_screen.dart';
import 'package:geo_quest/screens/welcome/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(colorScheme: MyTheme.lightTheme),
      title: "Geo Quest",
      initialRoute: '/',
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        PlayScreen.routeName: (context) => const PlayScreen(),
        HowToPlayScreen.routeName: (context) => const HowToPlayScreen(),
        NumQuestionScreen.routeName: (context) => const NumQuestionScreen(),
        QuizScreen.routeName: (context) => const QuizScreen(),
        LoseResultScreen.routeName: (context) => const LoseResultScreen(),
        WinResultScreen.routeName: (context) => const WinResultScreen(),
        CongratulationScreen.routeName: (context) =>
            const CongratulationScreen()
      },
      home: const SplashScreen(),
    );
  }
}
