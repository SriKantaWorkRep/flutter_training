import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:meta/meta.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherBlocLoadingState());
      try {
        WeatherFactory wf = WeatherFactory('731d1f29be6c2e9b0177949c17f1f952',
            language: Language.ENGLISH);
        print(event.cityName+" in BlocHome");
        Weather weather = await wf.currentWeatherByCityName(event.cityName==''?'Bangalore':event.cityName);
        // print(event.position.latitude.toString()+event.position.longitude.toString());
        print(weather.areaName);
        emit(WeatherBlocLoadingState());
        await Future.delayed(Duration(seconds: 2));
        emit(WeatherBlocSuccessState(weather: weather));
        // print("hi");
      } catch (e) {
        emit(WeatherBlocFailureState());
      }
    });
  }
}
