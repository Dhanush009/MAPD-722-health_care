// To parse this JSON data, do
//
//     final previousRecordsDataModel = previousRecordsDataModelFromJson(jsonString);

import 'dart:convert';

PreviousRecordsDataModel previousRecordsDataModelFromJson(String str) => PreviousRecordsDataModel.fromJson(json.decode(str));

String previousRecordsDataModelToJson(PreviousRecordsDataModel data) => json.encode(data.toJson());

class PreviousRecordsDataModel {
    PreviousRecordsDataModel({
        required this.success,
        required this.data,
    });

    bool success;
    List<PreviousRec> data;

    factory PreviousRecordsDataModel.fromJson(Map<String, dynamic> json) => PreviousRecordsDataModel(
        success: json["success"],
        data: List<PreviousRec>.from(json["data"].map((x) => PreviousRec.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PreviousRec {
    PreviousRec({
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

    factory PreviousRec.fromJson(Map<String, dynamic> json) => PreviousRec(
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
