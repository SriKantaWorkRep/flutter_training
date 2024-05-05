part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class InitialEvent extends WeatherEvent{}
class FetchWeatherEvent extends WeatherEvent {
 final String cityName;
 FetchWeatherEvent({required this.cityName});
 // final Position position;
 //  FetchWeatherEvent({required this.position});
 //  List<Object> get props=>[position];
}

