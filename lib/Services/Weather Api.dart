
import 'package:weather/weather.dart';

class weather{

Future<Weather> Get( String city) async{
    String key = '856822fd8e22db5e1ba48c0e7d69844a';
    String cityName = city;
    WeatherFactory wf = WeatherFactory(key);
    Weather forecast = await wf.currentWeatherByCityName(cityName);
  return forecast;

  }
}