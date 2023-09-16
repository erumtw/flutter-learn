import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/widgets/addition_info_item.dart';
import 'package:weather_app/widgets/weather_forcast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final cityName = "bangkok";
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey'));
      // first method
      // if(res.statusCode != 200){
      //   throw "An unexpected status code";
      // }
      // second method
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An unexpected status code";
      }

      return data;
    } catch (e) {
      throw e.toString();
    }

    // print(res.body);
  }

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
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;
          final icons = {
            'Rain': Icons.water_drop_sharp,
            'Clouds': Icons.cloud_rounded,
            'Sunny': Icons.sunny,
          };

          //current's weather varialbles
          final currentWeatherData = data['list'][0];
          final currentTempC =
              (currentWeatherData['main']['temp'] - 273.15).toStringAsFixed(2);
          final currentWeather = currentWeatherData['weather'][0]['main'];
          final humidity = currentWeatherData['main']['humidity'];
          final pressure = currentWeatherData['main']['pressure'];
          final windSpeed = currentWeatherData['wind']['speed'];
          return Padding(
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
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Text(
                                "$currentTempC °C",
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Icon(
                                icons[currentWeather],
                                size: 64,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "$currentWeather",
                                style: const TextStyle(
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
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 1; i < 6; i++)
                //         ForecastCard(
                //           times: data['list'][i]['dt_txt'],
                //           icon: Icons.cloud,
                //           temperature:
                //               data['list'][i]['main']['temp'].toString(),
                //         ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 145,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, i) {
                      final weather = data['list'][i + 1]['weather'][0]['main'];
                      final temperature =
                          data['list'][i]['main']['temp'].toString();
                      final times =
                          DateTime.parse(data['list'][i + 1]['dt_txt']);
                      return ForecastCard(
                          times: DateFormat.jm().format(times),
                          icon: icons[weather]!,
                          temperature: temperature);
                    },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditonalInfoItem(
                      icon: Icons.water_drop,
                      value: "$humidity",
                      label: "Humidity",
                    ),
                    AdditonalInfoItem(
                      icon: Icons.air_rounded,
                      value: "$windSpeed",
                      label: "Wind Speed",
                    ),
                    AdditonalInfoItem(
                      icon: Icons.play_for_work_outlined,
                      value: "$pressure",
                      label: "Pressure",
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
