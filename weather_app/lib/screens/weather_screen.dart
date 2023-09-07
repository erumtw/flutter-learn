import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/addition_info_item.dart';
import 'package:weather_app/widgets/weather_forcast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Today's Weather",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // InkWell(
          //   onTap: () {
          //     print("cliked")
          //   },
          //   child: const Icon(Icons.refresh_rounded),
          // )
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 8,
                      sigmaY: 8,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            "25 °C",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cloudy",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // weather forecast card
            const Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastCard(
                    times: "00:00",
                    icon: Icons.cloud,
                    temperature: "30 °C",
                  ),
                  ForecastCard(
                    times: "00:00",
                    icon: Icons.cloud,
                    temperature: "25 °C",
                  ),
                  ForecastCard(
                    times: "00:00",
                    icon: Icons.cloud,
                    temperature: "20 °C",
                  ),
                  ForecastCard(
                    times: "00:00",
                    icon: Icons.cloud,
                    temperature: "25 °C",
                  ),
                  ForecastCard(
                    times: "00:00",
                    icon: Icons.cloud,
                    temperature: "25 °C",
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // addtional card
            const Text(
              "Additonal Infomations",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditonalInfoItem(
                  icon: Icons.water_drop,
                  value: "90",
                  label: "Humidity",
                ),
                AdditonalInfoItem(
                  icon: Icons.air_rounded,
                  value: "7",
                  label: "Wind Speed",
                ),
                AdditonalInfoItem(
                  icon: Icons.umbrella_rounded,
                  value: "1000",
                  label: "Pressure",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
