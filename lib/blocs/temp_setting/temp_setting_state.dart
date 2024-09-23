// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'temp_setting_bloc.dart';

enum TempUnit { celsius, fahrenheit }

class TempSettingState extends Equatable {
  final TempUnit tempUnit;
  const TempSettingState({this.tempUnit = TempUnit.celsius});

  factory TempSettingState.initial() {
    return const TempSettingState();
  }

  @override
  List<Object> get props => [tempUnit];

  TempSettingState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  @override
  bool get stringify => true;
}
