import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_care/components/ViewRecord.dart';
import 'package:health_care/components/addpatienttest.dart';
import 'package:health_care/components/updatepatient.dart';
import 'package:health_care/model/patientdatamodel.dart';
import '../model/getpatientdatamodel.dart';
import '../model/updpatientdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hooks/flutter_hooks.dart';




class ViewPatient extends StatefulWidget {
  //const ViewPatient({super.key});
  late String id;
  ViewPatient({super.key, required this.id});

  @override
  State<ViewPatient> createState() => _ViewPatientState(id);
}

class _ViewPatientState extends State<ViewPatient>{

  String id;
  String _age="", _gender="", _doctor="",_department="";
  _ViewPatientState(this.id);

  void updateData(List data) {
    setState(() {

      _age = data[0];
      _gender = data[1];
      _doctor = data[2];
      _department = data[3];
      
    });

  }

  late GetData data = GetData(id: "1", firstname: "", lastname: "", gender: "", age: "", doctor: "", department: "", v: 0);

  Future<GetPatientDataModel> getPatientData() async{ 
    var response = await http.get(Uri.http('localhost:8080','/api/patient/$id'));

    if(response.statusCode == 200){
      
      String responseString = response.body;
      return getPatientDataModelFromJson(responseString);
      
    } 
    else{
      return getPatientDataModelFromJson(response.body);
    }
    
  }

  void setData() {
    getPatientData().then((value) {
      setState(() {
        data = value.data;
        _age = data!.age;
        _gender = data!.gender;
        _doctor = data!.doctor;
        _department = data!.department;
      });
    });
  }

  
  

  @override
  void initState(){
    super.initState();
   
    setData();

  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text('Patient Info', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          automaticallyImplyLeading: true,
          leading: IconButton (icon: Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            //setData(); 
            Navigator.pop(context);
            },)
        ),

        body: ListView(children: [
          Container(
            color: const Color.fromARGB(255, 64, 95, 253),
            height: 250,
            child: Column(children: [
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 90, 15, 8),
                  alignment:Alignment.center,
                  child: Text("${data!.firstname}'s Details ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  
                ),
              
                Container(
                      margin: const EdgeInsets.fromLTRB(5, 18, 5, 8),
                      child:SizedBox( 
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePatient(patient: data, updateCallback: updateData))) },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Update", textAlign: TextAlign.center),
                      ))
                    )
              
              
              
            ],)
          ),

          SizedBox(
                height: (MediaQuery.of(context).size.height) - 300,
                child:Column(children: [

                   Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Full Name:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text("${data!.firstname} ${data!.lastname}",
                        style: const TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                  
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Age:',
                        
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(_age,
                        style: const TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Gender:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 8, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(_gender,
                        style: const TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),


                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Doctor:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(_doctor,
                        style: const TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Condition:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Critical',
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Container(
                  width: double.infinity,
                  height: 80,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 18, 5, 8),
                      child:SizedBox( 
                        width: 170,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => AddPatientTest(patient: data))) },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Add Test Details", textAlign: TextAlign.center),
                      ))
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 18, 5, 8),
                      child:SizedBox( 
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => ViewRecord(patient: data))) },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("View Test Details", textAlign: TextAlign.center),
                      ))
                    )
                    
                  ]),
                )


                ],)
            
              )
        ],

        ),
 
        ));
  }

}

  