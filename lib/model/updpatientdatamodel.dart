// To parse this JSON data, do
//
//     final uptPatientDataModel = uptPatientDataModelFromJson(jsonString);

import 'dart:convert';

UptPatientDataModel uptPatientDataModelFromJson(String str) => UptPatientDataModel.fromJson(json.decode(str));

String uptPatientDataModelToJson(UptPatientDataModel data) => json.encode(data.toJson());

class UptPatientDataModel {
    UptPatientDataModel({
        required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    UptPatientData data;
    String message;

    factory UptPatientDataModel.fromJson(Map<String, dynamic> json) => UptPatientDataModel(
        success: json["success"],
        data: UptPatientData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class UptPatientData {
    UptPatientData({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.gender,
        required this.age,
        required this.doctor,
        required this.department,
        required this.v,
    });

    String id;
    String firstname;
    String lastname;
    String gender;
    String age;
    String doctor;
    String department;
    int v;

    factory UptPatientData.fromJson(Map<String, dynamic> json) => UptPatientData(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        age: json["age"],
        doctor: json["doctor"],
        department: json["department"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "age": age,
        "doctor": doctor,
        "department": department,
        "__v": v,
    };
}
