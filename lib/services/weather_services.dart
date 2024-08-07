import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e10fbe471577473f9c2141957232612';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': CityName,
          'days': 1,
          'aqi': 'no',
          'alerts': 'no'
        },
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'Failed to get weather information';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Failed to get weather information');
    }
  }
}
