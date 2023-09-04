import 'package:flutter/material.dart';
import 'package:my_weather_app/api/api_call.dart';
import 'package:my_weather_app/common/sizedbox.dart';
import 'package:my_weather_app/common/temp_converstion.dart';
import 'package:my_weather_app/common/textstyle.dart';
import 'package:my_weather_app/common/time_convertion.dart';

class ForecasteScreen extends StatefulWidget {
  const ForecasteScreen({super.key});

  @override
  State<ForecasteScreen> createState() => _ForecasteScreenState();
}

class _ForecasteScreenState extends State<ForecasteScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    ApiCall api = ApiCall();
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: api.getApiForecaste(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Text(
                "Error: ${snapshot.error}",
                style: style(color: Colors.amber),
              );
            } else {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Column(
                      children: [
                        spacing(height: height * 0.02),
                        Container(
                          height: height * 0.1,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Color(0xff202b3b),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    (snapshot.data.dailyForecasts[index].date)
                                        .substring(8, 10),
                                    style: style(
                                        color: Colors.white,
                                        sized: 20,
                                        fw: FontWeight.w300),
                                  ),
                                ),
                              ),
                              spacing(width: width * 0.05),
                              Center(
                                child: Text(
                                  Day(index),
                                  style: style(
                                      color: Colors.white,
                                      sized: 30,
                                      fw: FontWeight.w400),
                                ),
                              ),
                              spacing(width: width * 0.15),
                              Center(
                                child: Text(
                                  "${tempConverter(snapshot.data.dailyForecasts[index].temperature.maximum.value).toStringAsFixed(0)} C",
                                  style: style(
                                      color: Colors.white,
                                      sized: 30,
                                      fw: FontWeight.w400),
                                ),
                              ),
                              spacing(width: width * 0.02),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: height * 0.1,
                                    width: width * 0.1,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage('assets/sun.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // spacing(height: height * 0.02)
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
