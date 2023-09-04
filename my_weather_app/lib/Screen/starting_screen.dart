import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/Screen/home_screen.dart';
import 'package:my_weather_app/Screen/tabcontroller.dart';
import 'package:my_weather_app/common/sizedbox.dart';
import 'package:my_weather_app/common/textstyle.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => TabbarScreen()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: Center(
                child: Container(
                  height: height * 0.2,
                  width: width * 0.2,
                  child: Image.asset('assets/sun.png'),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * pi,
                  child: child,
                );
              },
            ),
            spacing(height: height * 0.1),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "BREEZE",
                  textStyle: style(
                      fw: FontWeight.w600,
                      color: Colors.white,
                      sized: 32,
                      spacing: 20),
                  speed: const Duration(milliseconds: 200),
                ),
                FadeAnimatedText(
                  "WEATHER APP",
                  textStyle: style(
                    fw: FontWeight.w400,
                    color: Colors.white,
                    sized: 20,
                  ),
                )
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ]),
    );
  }
}
