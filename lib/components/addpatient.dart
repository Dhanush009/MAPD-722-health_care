import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import '../model/datamodel.dart';
import 'package:flutter/services.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  DataModel? _dataModel;

  late DataModel data;

  final formKey = GlobalKey<FormState>();

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _doc = TextEditingController();
  TextEditingController _dept = TextEditingController();

  Future<DataModel?> postData(String fname, String lname, String age, String gender, String doc, String dept) async{ 
    var response = await http.post(Uri.http('10.0.0.123:8090','/api/newpatient'), body: {
      "firstname":fname,
      "lastname": lname,
      "gender": gender,
      "age": age,
      "doctor": doc,
      "department": dept,
      "condition": "Normal"
    });



    if(response.statusCode == 200){
      
      String responseString = response.body;
      data = dataModelFromJson(responseString);
      
    } 
    else{
    return null;
    }
  }

  void clearText() {
    _firstname.clear();
    _lastname.clear();
    _age.clear();
    _gender.clear();
    _doc.clear();
    _dept.clear();
  }

  void showAlert() {

    if( data.success == true){
      QuickAlert.show(context: context, 
      text: 'Patient Added!!',
      type: QuickAlertType.success);
    }else{
      QuickAlert.show(context: context, text:"Unable to add patient!!" ,type: QuickAlertType.error);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Patient', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          
        ),
        body: ListView(children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Form(
              key: formKey,
              child:Column(
                children: [
                   Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _firstname,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Firstname ',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value)){
                        return 'Enter valid name';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _lastname,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Lastname ',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)){
                        return 'Enter correct value';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),

                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _age,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Age',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)){
                        return 'Enter valid name';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),
              
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _gender,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Gender',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value)){
                        return 'Select Gender';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),

                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _doc,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Doctor ',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value)){
                        return 'Enter valid name';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),

                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 18, 15, 8),
                    alignment: Alignment.topLeft,
                    child: TextFormField(
                      controller: _dept,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Department ',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value)){
                        return 'Select Department';
                      }
                      else{
                        return null;
                      }
                    },   
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 80,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 18, 39, 8),
                      child:SizedBox( 
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() async { 
                          String fname = _firstname.text.toString();
                          String lname = _lastname.text.toString();
                          String age = _age.text.toString();
                          String gender = _gender.text.toString();
                          String doctor = _doc.text.toString();
                          String department = _dept.text.toString();

                          DataModel? data = await postData(fname, lname, age, gender, doctor, department);

                          setState(() {
                            _dataModel = data;
                          });

                          showAlert();
                          clearText();

                         },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Add", textAlign: TextAlign.center),
                      ))
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(39, 18, 15, 8),
                      child:
                      SizedBox( 
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() {
                          clearText(); },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Cancel", textAlign: TextAlign.center),
                      ))
                    )
                    
                  ]),
                )

                ],
              ) 
             
            )
          )
        ]),
    ));
  }
}