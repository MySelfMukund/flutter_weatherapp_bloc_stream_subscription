// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

enum ThemeStatus { light, dark }

class ThemeState extends Equatable {
  final ThemeStatus themeStatus;
  const ThemeState({
    this.themeStatus = ThemeStatus.light,
  });
  factory ThemeState.inital() {
    return const ThemeState();
  }

  @override
  List<Object> get props => [themeStatus];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    ThemeStatus? themeStatus,
  }) {
    return ThemeState(
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }
}
