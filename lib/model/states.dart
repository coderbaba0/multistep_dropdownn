// To parse this JSON data, do
//
//     final stateData = stateDataFromJson(jsonString);

import 'dart:convert';

StateModel stateDataFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateDataToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  int status;
  String message;
  List<StateDatum> data;

  StateModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    status: json["status"],
    message: json["message"],
    data: List<StateDatum>.from(json["Data"].map((x) => StateDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class StateDatum {
  String stateId;
  String stateTitle;

  StateDatum({
    required this.stateId,
    required this.stateTitle,
  });

  factory StateDatum.fromJson(Map<String, dynamic> json) => StateDatum(
    stateId: json["state_id"],
    stateTitle: json["state_title"],
  );
  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "state_title": stateTitle,
  };
}
