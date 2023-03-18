// To parse this JSON data, do
//
//     final patientTestRecordsDataModel = patientTestRecordsDataModelFromJson(jsonString);

import 'dart:convert';

PatientTestRecordsDataModel patientTestRecordsDataModelFromJson(String str) => PatientTestRecordsDataModel.fromJson(json.decode(str));

String patientTestRecordsDataModelToJson(PatientTestRecordsDataModel data) => json.encode(data.toJson());

class PatientTestRecordsDataModel {
    PatientTestRecordsDataModel({
        required this.success,
        required this.data,
    });

    bool success;
    RecordData data;

    factory PatientTestRecordsDataModel.fromJson(Map<String, dynamic> json) => PatientTestRecordsDataModel(
        success: json["success"],
        data: RecordData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class RecordData {
    RecordData({
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

    factory RecordData.fromJson(Map<String, dynamic> json) => RecordData(
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
