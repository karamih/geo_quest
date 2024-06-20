import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geo_quest/screens/home/play_screen.dart';
import 'package:geo_quest/screens/welcome/widgets/base_onboard.dart';
import 'package:geo_quest/screens/welcome/widgets/last_onboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
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

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: _controller,
            children: [
              BaseOnboard(
                controller: _controller,
                imgPath: 'assets/images/onb1.svg',
                title1: 'Welcome To',
                title2: 'GeoQuest!',
                description:
                    'Embark on a journey around the world with fun and challenging questions about countries. Ready to test your geography skills?',
              ),
              BaseOnboard(
                controller: _controller,
                imgPath: 'assets/images/onb2.svg',
                title1: 'Discover The',
                title2: 'World!',
                description:
                    'Explore fascinating facts and trivia about countries. From capitals to cultures, GeoQuest is your passport to global knowledge.',
              ),
              BaseOnboard(
                controller: _controller,
                imgPath: 'assets/images/onb3.svg',
                title1: 'Challenge Your',
                title2: 'Knowledge!',
                description:
                    'How much do you really know about the world? Take on our quizzes and find out. Compete with friends and climb the leaderboard!',
              ),
              const LastOnboard(
                imgPath: 'assets/images/onb4.svg',
                title: 'Learn And Have Fun!',
                description:
                    "GeoQuest isn't just a quiz app—it's a learning adventure. Improve your geography knowledge while having a blast. Let's get started!",
              ),
            ],
          ),
          Positioned(
            top: 70,
            right: 25,
            child: _currentPage != 3
                ? TextButton(
                    onPressed: () {
                      _controller.animateToPage(3,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.rubikWetPaint(
                          color: scheme.tertiary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ))
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 110,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              onDotClicked: (index) {
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              effect: ExpandingDotsEffect(
                spacing: 5,
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: scheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: _currentPage != 3 ? 30 : 20,
            child: InkWell(
              onTap: () {
                if (_currentPage < 3) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, PlayScreen.routeName);
                }
              },
              child: SvgPicture.asset(
                _currentPage != 3
                    ? 'assets/images/btn.svg'
                    : 'assets/images/btn4.svg', // Use different SVG for the last page
              ),
            ),
          ),
        ],
      ),
    );
  }
}
