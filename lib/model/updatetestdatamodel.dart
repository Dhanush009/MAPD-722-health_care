// To parse this JSON data, do
//
//     final updateTestRecordsDataModel = updateTestRecordsDataModelFromJson(jsonString);

import 'dart:convert';

UpdateTestRecordsDataModel updateTestRecordsDataModelFromJson(String str) => UpdateTestRecordsDataModel.fromJson(json.decode(str));

String updateTestRecordsDataModelToJson(UpdateTestRecordsDataModel data) => json.encode(data.toJson());

class UpdateTestRecordsDataModel {
    UpdateTestRecordsDataModel({
        required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    UptTestData data;
    String message;

    factory UpdateTestRecordsDataModel.fromJson(Map<String, dynamic> json) => UpdateTestRecordsDataModel(
        success: json["success"],
        data: UptTestData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class UptTestData {
    UptTestData({
        required this.id,
        required this.patientId,
        required this.bloodPressure,
        required this.respiratoryRate,
        required this.oxygenLevel,
        required this.heartbeat,
        required this.date,
        required this.v,
    });

    String id;
    String patientId;
    String bloodPressure;
    String respiratoryRate;
    String oxygenLevel;
    String heartbeat;
    String date;
    int v;

    factory UptTestData.fromJson(Map<String, dynamic> json) => UptTestData(
        id: json["_id"],
        patientId: json["patientId"],
        bloodPressure: json["bloodPressure"],
        respiratoryRate: json["respiratoryRate"],
        oxygenLevel: json["oxygenLevel"],
        heartbeat: json["heartbeat"],
        date: json["date"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "patientId": patientId,
        "bloodPressure": bloodPressure,
        "respiratoryRate": respiratoryRate,
        "oxygenLevel": oxygenLevel,
        "heartbeat": heartbeat,
        "date": date,
        "__v": v,
    };
}
