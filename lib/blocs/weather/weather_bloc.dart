// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app_bloc_stream_subscriotion/repositors/weather_repository.dart';

import '../../models/models.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({
    required this.weatherRepository,
  }) : super(WeatherState.initial()) {
    on<FetchWeatherEvent>(_fetchWeatherEvent);
  }

  Future<void> _fetchWeatherEvent(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    try {
      final weather = await weatherRepository.getWeather(event.cityName);
      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } on CustomError catch (e) {
      emit(state.copyWith(status: WeatherStatus.error, error: e));
    }
  }
}
