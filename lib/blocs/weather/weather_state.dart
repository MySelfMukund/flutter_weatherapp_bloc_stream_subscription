// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final CustomError? error;
  final Weather weather;

  const WeatherState({
    required this.status,
    this.error,
    required this.weather,
  });

  factory WeatherState.initial() {
    return WeatherState(status: WeatherStatus.initial, error: const CustomError(), weather: Weather.inital());
  }

  @override
  List<Object> get props => [status, error ?? '', weather ?? ''];

  WeatherState copyWith({
    WeatherStatus? status,
    CustomError? error,
    Weather? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      error: error ?? this.error,
      weather: weather ?? this.weather,
    );
  }

  @override
  bool get stringify => true;
}
