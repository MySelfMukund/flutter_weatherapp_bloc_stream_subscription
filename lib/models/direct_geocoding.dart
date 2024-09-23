// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DirectGeocoding extends Equatable {
  String name;
  double lat;
  double lon;
  String country;
  DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  DirectGeocoding copyWith({
    String? name,
    double? lat,
    double? lon,
    String? country,
  }) {
    return DirectGeocoding(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
    );
  }

  factory DirectGeocoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];
    return DirectGeocoding(name: data['name'], lat: data['lat'], lon: data['lon'], country: data['country']);
  }

  @override
  List<Object?> get props => [name, lat, lon, country];

  @override
  String toString() {
    return 'DirectGeocoding(name: $name, lat: $lat, lon: $lon, country: $country)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }

  factory DirectGeocoding.fromMap(List<dynamic> json) {
    final Map<String, dynamic> map = json[0];
    return DirectGeocoding(
      name: map['name'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
