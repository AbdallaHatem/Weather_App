import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/pexels-maxavans-5065550.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  onSubmitted: (value) async {
                    WeatherModel weatherModel;
                    try {
                      weatherModel = await WeatherService(Dio()).getCurrentWeather(CityName: value);
                      _showWeatherDialog(context, weatherModel);
                    } catch (e) {
                      _showErrorDialog(context, e.toString());
                    }
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                    hintText: 'City Name',
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showWeatherDialog(BuildContext context, WeatherModel weatherModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Weather Info for ${weatherModel.cityName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${weatherModel.date}'),
              Text('Temperature: ${weatherModel.temp}°C'),
              Text('Min Temperature: ${weatherModel.minTemp}°C'),
              Text('Max Temperature: ${weatherModel.maxTemp}°C'),
              Text('Condition: ${weatherModel.weatherState}'),
              if (weatherModel.image != null)
                Image.network(weatherModel.image!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('Failed to get weather information: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
