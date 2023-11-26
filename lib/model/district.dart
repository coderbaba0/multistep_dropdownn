// To parse this JSON data, do
//
//     final districtData = districtDataFromJson(jsonString);

import 'dart:convert';

DistrictModel districtDataFromJson(String str) => DistrictModel.fromJson(json.decode(str));

String districtDataToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  int status;
  String message;
  List<DistDatum> data;

  DistrictModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    status: json["status"],
    message: json["message"],
    data: List<DistDatum>.from(json["Data"].map((x) => DistDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DistDatum {
  String districtid;
  String districtTitle;
  String stateId;

  DistDatum({
    required this.districtid,
    required this.districtTitle,
    required this.stateId,
  });

  factory DistDatum.fromJson(Map<String, dynamic> json) => DistDatum(
    districtid: json["districtid"],
    districtTitle: json["district_title"],
    stateId: json["state_id"],
  );

  Map<String, dynamic> toJson() => {
    "districtid": districtid,
    "district_title": districtTitle,
    "state_id": stateId,
  };
}
