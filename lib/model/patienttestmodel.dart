// To parse this JSON data, do
//
//     final patientTestDataModel = patientTestDataModelFromJson(jsonString);

import 'dart:convert';

PatientTestDataModel patientTestDataModelFromJson(String str) => PatientTestDataModel.fromJson(json.decode(str));

String patientTestDataModelToJson(PatientTestDataModel data) => json.encode(data.toJson());

class PatientTestDataModel {
    PatientTestDataModel({
        required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    PatientTestData data;
    String message;

    factory PatientTestDataModel.fromJson(Map<String, dynamic> json) => PatientTestDataModel(
        success: json["success"],
        data: PatientTestData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class PatientTestData {
    PatientTestData({
        required this.patientId,
        required this.bloodPressure,
        required this.respiratoryRate,
        required this.oxygenLevel,
        required this.heartbeat,
        required this.date,
        required this.id,
        required this.v,
    });

    String patientId;
    String bloodPressure;
    String respiratoryRate;
    String oxygenLevel;
    String heartbeat;
    String date;
    String id;
    int v;

    factory PatientTestData.fromJson(Map<String, dynamic> json) => PatientTestData(
        patientId: json["patientId"],
        bloodPressure: json["bloodPressure"],
        respiratoryRate: json["respiratoryRate"],
        oxygenLevel: json["oxygenLevel"],
        heartbeat: json["heartbeat"],
        date: json["date"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "bloodPressure": bloodPressure,
        "respiratoryRate": respiratoryRate,
        "oxygenLevel": oxygenLevel,
        "heartbeat": heartbeat,
        "date": date,
        "_id": id,
        "__v": v,
    };
}
