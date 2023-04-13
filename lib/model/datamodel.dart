// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    Data data;
    String message;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.firstname,
        required this.lastname,
        required this.gender,
        required this.age,
        required this.doctor,
        required this.department,
        required this.condition
    });

    String firstname;
    String lastname;
    String gender;
    String age;
    String doctor;
    String department;
    String condition;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        age: json["age"],
        doctor: json["doctor"],
        department: json["department"],
        condition: json["condition"]
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "age": age,
        "doctor": doctor,
        "department": department,
        "condition": condition
    };
}
