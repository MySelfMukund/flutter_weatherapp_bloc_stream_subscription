// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherExceptions implements Exception {
  String message;
  WeatherExceptions([this.message = 'Something went wront']) {
    message = 'Weather Exception $message';
  }

  @override
  String toString() => message;
}
