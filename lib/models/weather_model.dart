class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherState;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherState,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      image: 'https:${json['forecast']['forecastday'][0]['day']['condition']['icon']}',
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherState: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
