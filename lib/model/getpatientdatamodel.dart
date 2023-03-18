// To parse this JSON data, do
//
//     final getPatientDataModel = getPatientDataModelFromJson(jsonString);

import 'dart:convert';

GetPatientDataModel getPatientDataModelFromJson(String str) => GetPatientDataModel.fromJson(json.decode(str));

String getPatientDataModelToJson(GetPatientDataModel data) => json.encode(data.toJson());

class GetPatientDataModel {
    GetPatientDataModel({
        required this.success,
        required this.data,
    });

    bool success;
    GetData data;

    factory GetPatientDataModel.fromJson(Map<String, dynamic> json) => GetPatientDataModel(
        success: json["success"],
        data: GetData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class GetData {
    GetData({
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

    factory GetData.fromJson(Map<String, dynamic> json) => GetData(
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
