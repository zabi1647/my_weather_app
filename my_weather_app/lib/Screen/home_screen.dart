import 'package:flutter/material.dart';

import 'package:my_weather_app/api/api_function.dart';

import 'package:my_weather_app/common/row_widget.dart';
import 'package:my_weather_app/common/sizedbox.dart';
import 'package:my_weather_app/common/textstyle.dart';
import 'package:my_weather_app/common/time_convertion.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    ApiFunction api = ApiFunction();
    var time = DateTime.now();
    var hour = time.hour;
    var mint = time.minute;
    String amPm = hour < 12 ? 'AM' : 'PM';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
          future: api.getApiCall(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade600,
                      child: Column(
                        children: [
                          ListTile(
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ));
                },
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data.name,
                      style: style(
                        fw: FontWeight.w700,
                        sized: 25,
                        spacing: 15,
                        color: Colors.white,
                      ),
                    ),
                    spacing(height: height * 0.005),
                    Text(
                      "${hour}:${mint} $amPm",
                      style: style(
                        color: Colors.white54,
                      ),
                    ),
                    spacing(height: height * 0.03),
                    Container(
                      height: height * 0.1,
                      width: width * 0.1,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/sunny.png"),
                        ),
                      ),
                    ),
                    spacing(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (snapshot.data.main.temp - 273).toStringAsFixed(2),
                          style: style(
                            fw: FontWeight.w700,
                            sized: 25,
                            spacing: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " C",
                          style: style(
                            fw: FontWeight.w700,
                            sized: 25,
                            spacing: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    spacing(height: height * 0.03),
                    Container(
                      height: height * 0.25,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xff202b3b),
                        borderRadius: BorderRadius.circular(height * 0.020),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: FractionalOffset(0.05, 0.05),
                            child: Text(
                              "Today forcaste",
                              style: style(
                                color: Colors.white54,
                                sized: 20,
                              ),
                            ),
                          ),
                          spacing(height: height * 0.012),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Max temp",
                                        style: style(
                                          color: Colors.white54,
                                          sized: 15,
                                        ),
                                      ),
                                      spacing(height: height * 0.03),
                                      Text(
                                        (snapshot.data.main.tempMax - 273)
                                            .toStringAsFixed(2),
                                        style: style(
                                          color: Colors.white54,
                                          sized: 20,
                                        ),
                                      ),
                                      const ImageIcon(
                                        AssetImage("assets/temp.png"),
                                        size: 60,
                                      )
                                    ],
                                  ),
                                  spacing(width: width * 0.03),
                                  const VerticalDivider(
                                    color: Colors.white54,
                                  ),
                                  spacing(width: width * 0.03),
                                  Column(
                                    children: [
                                      Text(
                                        "Feels like",
                                        style: style(
                                          color: Colors.white54,
                                          sized: 15,
                                        ),
                                      ),
                                      spacing(height: height * 0.025),
                                      Text(
                                        (snapshot.data.main.feelsLike - 273)
                                            .toStringAsFixed(2),
                                        style: style(
                                          color: Colors.white54,
                                          sized: 20,
                                        ),
                                      ),
                                      const ImageIcon(
                                        AssetImage("assets/temp.png"),
                                        size: 60,
                                      )
                                    ],
                                  ),
                                  spacing(width: width * 0.03),
                                  const VerticalDivider(
                                    color: Colors.white54,
                                  ),
                                  spacing(width: width * 0.03),
                                  Column(
                                    children: [
                                      Text(
                                        "Min temp",
                                        style: style(
                                          color: Colors.white54,
                                          sized: 15,
                                        ),
                                      ),
                                      spacing(height: height * 0.025),
                                      Text(
                                        (snapshot.data.main.tempMin - 273)
                                            .toStringAsFixed(2),
                                        style: style(
                                          color: Colors.white54,
                                          sized: 20,
                                        ),
                                      ),
                                      const ImageIcon(
                                        AssetImage("assets/temp.png"),
                                        size: 60,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing(height: height * 0.02),
                    Container(
                      height: height * 0.3,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: width * 0.4,
                                  height: height * 0.14,
                                  decoration: BoxDecoration(
                                    color: Color(0xff202b3b),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      spacing(height: height * 0.03),
                                      Align(
                                        alignment: Alignment(-0.7, 0.2),
                                        child: Text(
                                          "Wind Speed",
                                          style: style(color: Colors.white54),
                                        ),
                                      ),
                                      spacing(height: height * 0.02),
                                      Align(
                                        alignment: Alignment(-0.7, 0.2),
                                        child: Text(
                                          snapshot.data.wind.speed.toString() +
                                              " m/s ",
                                          style: style(
                                              color: Colors.white54, sized: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              spacing(height: height * 0.009),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: width * 0.4,
                                  height: height * 0.14,
                                  decoration: BoxDecoration(
                                    color: Color(0xff202b3b),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      spacing(height: height * 0.03),
                                      Align(
                                        alignment: Alignment(-0.7, 0.2),
                                        child: Text(
                                          "Atmospheric pressure",
                                          style: style(color: Colors.white54),
                                        ),
                                      ),
                                      spacing(height: height * 0.02),
                                      Align(
                                        alignment: Alignment(-0.7, 0.2),
                                        child: Text(
                                          snapshot.data.main.grndLevel
                                                  .toString() +
                                              " hPa ",
                                          style: style(
                                              color: Colors.white54, sized: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          spacing(width: width * 0.02),
                          Align(
                            alignment: Alignment(1, 06),
                            child: Container(
                              width: width * 0.38,
                              height: height * 0.3,
                              decoration: BoxDecoration(
                                color: Color(0xff202b3b),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    spacing(height: height * 0.02),
                                    CustomRow(
                                      data1: "Sun Rise",
                                      data2: Time(snapshot.data.sys.sunrise),
                                      space: width * 0.04,
                                    ),
                                    spacing(height: height * 0.02),
                                    CustomRow(
                                      data1: "Sun Set",
                                      data2: Time(snapshot.data.sys.sunset),
                                      space: width * 0.05,
                                    ),
                                    spacing(height: height * 0.02),
                                    CustomRow(
                                      data1: "Chances of Rain",
                                      data2:
                                          snapshot.data.clouds.all.toString() +
                                              "%",
                                      space: width * 0.03,
                                    ),
                                    spacing(height: height * 0.02),
                                    CustomRow(
                                      data1: "Visibility",
                                      data2:
                                          snapshot.data.visibility.toString() +
                                              "m",
                                      space: width * 0.03,
                                    ),
                                    spacing(height: height * 0.02),
                                    CustomRow(
                                      data1: "Humidity",
                                      data2: snapshot.data.main.humidity
                                              .toString() +
                                          "%",
                                      space: width * 0.03,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
