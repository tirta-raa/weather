part of 'services.dart';

class WeatherDisplayData {
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherImage});
}

class WeatherData {
  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;

  WeatherData({
    required this.locationData,
    required this.currentTemperature,
    required this.currentCondition,
  });

  Future<void> getCurrentTemperature() async {
    var response = await http.get(Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric',
    ));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
      } catch (e) {
        print(e);
      }
    } else {
      print('Could not fetch temperature!');
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherImage: AssetImage('assets/cloud.png'),
      );
    } else {
      var now = new DateTime.now();

      if (now.hour >= 15) {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/moon.png'),
        );
      } else {
        return WeatherDisplayData(
          weatherImage: AssetImage('assets/sun.png'),
        );
      }
    }
  }
}
