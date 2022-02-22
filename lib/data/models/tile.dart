import 'package:flutter/cupertino.dart';
import 'package:flutter_puzzle_hack/data/models/location.dart';
import 'package:flutter_puzzle_hack/data/models/position.dart';

class Tile {
  int value;
  bool tileIsWhiteSpace;
  Location correctLocation;
  Location currentLocation;

  Tile({
    required this.value,
    required this.correctLocation,
    required this.currentLocation,
    this.tileIsWhiteSpace = false,
  });

  bool get isAtCorrectLocation => correctLocation == currentLocation;

  Position getPosition(BuildContext context, double tileWidth) {
    return Position(top: (currentLocation.y - 1) * tileWidth, left: (currentLocation.x - 1) * tileWidth);
  }

  Tile copyWith({
    value,
    width,
    correctLocation,
    currentLocation,
    tileIsWhiteSpace,
  }) {
    return Tile(
      value: value ?? this.value,
      correctLocation: correctLocation ?? this.correctLocation,
      currentLocation: currentLocation ?? this.currentLocation,
      tileIsWhiteSpace: tileIsWhiteSpace ?? this.tileIsWhiteSpace,
    );
  }

  @override
  String toString() {
    return 'Tile(value: $value, correctLocation: $correctLocation, currentLocation: $currentLocation)';
  }

  factory Tile.fromJson(Map<String, dynamic> json) {
    return Tile(
      value: json['value'],
      tileIsWhiteSpace: json['tileIsWhiteSpace'],
      correctLocation: Location.fromJson(json['correctLocation']),
      currentLocation: Location.fromJson(json['currentLocation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'tileIsWhiteSpace': tileIsWhiteSpace,
      'correctLocation': correctLocation.toJson(),
      'currentLocation': currentLocation.toJson(),
    };
  }
}
