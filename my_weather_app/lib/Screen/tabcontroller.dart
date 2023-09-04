import 'package:flutter/material.dart';
import 'package:my_weather_app/Screen/forecaste_screen.dart';
import 'package:my_weather_app/Screen/home_screen.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: height * 0.05,
                child: const TabBar(
                  tabs: [
                    ImageIcon(AssetImage("assets/rain.png")),
                    Icon(Icons.more_horiz_outlined),
                  ],
                  labelColor: Color(0xff202b3b),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                HomeScreen(),
                ForecasteScreen(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
