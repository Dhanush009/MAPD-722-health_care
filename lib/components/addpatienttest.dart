import 'package:flutter/material.dart';
import 'package:health_care/model/getpatientdatamodel.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../model/patienttestmodel.dart';
import 'package:quickalert/quickalert.dart';

class AddPatientTest extends StatefulWidget {
  //const AddPatientTest({super.key});
  late GetData patient;
  AddPatientTest({super.key, required this.patient});

  @override
  State<AddPatientTest> createState() => _AddPatientTestState(patient);
}

class _AddPatientTestState extends State<AddPatientTest> {

  GetData patient;
  _AddPatientTestState(this.patient);


  PatientTestDataModel? patientTestModel;

  late PatientTestData testData = PatientTestData(patientId: "", bloodPressure: "", respiratoryRate: "", oxygenLevel: "", heartbeat: "", date: "", id: "", v: 0);

  final formKey = GlobalKey<FormState>();

  TextEditingController _date = TextEditingController();
  TextEditingController _resp = TextEditingController();
  TextEditingController _bloodP = TextEditingController();
  TextEditingController _oxygen = TextEditingController();
  TextEditingController _heartbeat = TextEditingController();

  Future<PatientTestDataModel?> postTestData(String bloodP, String resp, String oxygen, String heartbeat, String date) async{ 
    var response = await http.post(Uri.http('localhost:8080','/api/newrecord/${patient.id}'), body: {
      "patientId": patient.id,
      "bloodPressure": bloodP,
      "respiratoryRate": resp,
      "oxygenLevel": oxygen,
      "heartbeat": heartbeat,
      "date": date,
    });

    String responseString = response.body;

    if(response.statusCode == 200){
      
      testData = patientTestDataModelFromJson(responseString).data;
      
    } 
    else{
      
    return patientTestDataModelFromJson(responseString);
    }
  }

   void clearText() {
    _bloodP.clear();
    _resp.clear();
    _oxygen.clear();
    _heartbeat.clear();
    _date.clear();
  }

    void showAlert() {

    if( testData.patientId == patient.id){
      QuickAlert.show(context: context, 
      text: 'Test Record Added!!',
      type: QuickAlertType.success);
    }else{
      QuickAlert.show(context: context, text:"Unable to add test record!!" ,type: QuickAlertType.error);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add Test Details', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          automaticallyImplyLeading: true,
          leading: IconButton (icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),)
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
                      controller: _bloodP,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Blood Pressure ',
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
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
                        return 'Enter valid value';
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
                      controller: _resp,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Respiratory Rate ',
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
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
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
                      controller: _oxygen,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Blood Oxygen Level',
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
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
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
                      controller: _heartbeat,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'HeartBeat Rate',
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
                      if(value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value!)){
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
                      controller: _date,
                      decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: 'Admission Date ',
                      labelStyle: TextStyle(fontSize: 18),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelStyle: TextStyle(
                        fontSize: 22,
                      ),
                      fillColor: Color.fromARGB(31, 136, 136, 136),
                      filled:true
                    ),
                    style: const TextStyle(fontSize: 18),
                    onTap:() async {
                      DateTime? pickedDate = await showDatePicker(context: context, 
                      initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime(2100));

                      if(pickedDate!=null){
                        setState(() {
                          _date.text = DateFormat('yyyy-Mm-dd').format(pickedDate);
                        });
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
                          String bloodP = _bloodP.text.toString();
                          String resp = _resp.text.toString();
                          String oxygen = _oxygen.text.toString();
                          String heartbeat = _heartbeat.text.toString();
                          String date = _date.text.toString();

                          PatientTestDataModel? data = await postTestData(bloodP, resp, oxygen, heartbeat, date);

                          setState(() {
                            patientTestModel = data;
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
                      child:SizedBox( 
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { clearText() },
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