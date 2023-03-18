// To parse this JSON data, do
//
//     final patientDataModel = patientDataModelFromJson(jsonString);

import 'dart:convert';

PatientDataModel patientDataModelFromJson(String str) => PatientDataModel.fromJson(json.decode(str));

String patientDataModelToJson(PatientDataModel data) => json.encode(data.toJson());

class PatientDataModel {
    PatientDataModel({
        required this.success,
        required this.data,
    });

    bool success;
    List<Datum> data;

    factory PatientDataModel.fromJson(Map<String, dynamic> json) => PatientDataModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
