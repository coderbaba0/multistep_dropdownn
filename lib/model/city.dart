// To parse this JSON data, do
//
//     final cityData = cityDataFromJson(jsonString);

import 'dart:convert';

CityModel cityDataFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityDataToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  int status;
  String message;
  List<CityDatum> data;

  CityModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    status: json["status"],
    message: json["message"],
    data: List<CityDatum>.from(json["Data"].map((x) => CityDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CityDatum {
  String id;
  String name;
  String stateId;

  CityDatum({
    required this.id,
    required this.name,
    required this.stateId,
  });

  factory CityDatum.fromJson(Map<String, dynamic> json) => CityDatum(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_id": stateId,
  };
}
