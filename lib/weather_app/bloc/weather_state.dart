part of 'weather_bloc.dart';

abstract class WeatherBlocState {
}

class WeatherBlocInitialState extends WeatherBlocState {
}

class WeatherBlocLoadingState extends WeatherBlocState {}

class WeatherBlocFailureState extends WeatherBlocState {}

class WeatherBlocSuccessState extends WeatherBlocState {
   Weather weather;
  WeatherBlocSuccessState({required this.weather});
}
