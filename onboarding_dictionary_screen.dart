import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Dictionary%20App/dictionary_colors.dart';
import 'package:flutter_ui_designs/Dictionary%20App/dictionary_home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingDictionaryScreen extends StatefulWidget {
  const OnBoardingDictionaryScreen({super.key});

  @override
  State<OnBoardingDictionaryScreen> createState() =>
      _OnBoardingDictionaryScreenState();
}

class _OnBoardingDictionaryScreenState
    extends State<OnBoardingDictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          curve: Curves.easeInOut,
          globalBackgroundColor: Colors.white,
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              titleWidget: Text(
                "Explore Words",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: headingColor,
                ),
              ),
              bodyWidget: Text(
                "Discover thousands of words with their meanings, synonyms, and usage examples to enhance your vocabulary and understanding.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: descriptionColor,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/dictionary/onBoarding_1.jpg",
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Words Accent",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: headingColor,
                ),
              ),
              bodyWidget: Text(
                "Listen to accurate pronunciations of words to improve your speaking and listening skills, making communication more effective.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: descriptionColor,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/dictionary/onBoarding_2.jpg",
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Track Favorites",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: headingColor,
                ),
              ),
              bodyWidget: Text(
                "Discover thousands of words with their meanings, synonyms, and usage examples to enhance your vocabulary and understanding.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: descriptionColor,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/dictionary/onBoarding_3.jpg",
                  ),
                ),
              ),
            ),
            PageViewModel(
              titleWidget: Text(
                "Word Challenges",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: headingColor,
                ),
              ),
              bodyWidget: Text(
                "Participate in daily word challenges to expand your vocabulary and test your knowledge with fun and engaging quizzes.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: descriptionColor,
                  height: 1.6,
                  fontSize: 16,
                ),
              ),
              image: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/dictionary/onBoarding_4.jpg",
                  ),
                ),
              ),
            ),
          ],
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DictionaryHomePage(),
              ),
            );
          },
          onSkip: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DictionaryHomePage(),
              ),
            );
          },
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: buttonColor,
            ),
          ),
          done: Text(
            "Done",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: buttonColor,
            ),
          ),
          next: Icon(
            Icons.arrow_forward_ios_rounded,
            color: buttonColor,
            size: 24,
          ),
          dotsDecorator: DotsDecorator(
            size: Size.square(10),
            activeSize: Size(30, 10),
            color: buttonColor.withOpacity(.2),
            activeColor: buttonColor,
            spacing: EdgeInsets.symmetric(horizontal: 4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
