import 'package:flutter/material.dart';
import 'package:health_care/model/patienttestrecordsdatamodel.dart';
import 'package:health_care/model/updatetestdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class UpdatePatientTest extends StatefulWidget {
  //const UpdatePatientTest({super.key});
  late RecordData testRecord;
  final Function updateTestData;
  UpdatePatientTest({super.key,required this.testRecord, required this.updateTestData});

  @override
  State<UpdatePatientTest> createState() => _UpdatePatientTestState(testRecord,updateTestData);
}

class _UpdatePatientTestState extends State<UpdatePatientTest> {

  RecordData testRecord;
  final Function updTestCallback;
  _UpdatePatientTestState(this.testRecord, this.updTestCallback);

  UpdateTestRecordsDataModel? uptRecord;
  late UptTestData uptTest = UptTestData(id: "", patientId: "", bloodPressure: "", respiratoryRate: "", oxygenLevel: "", heartbeat: "", date: "", v: 0);


  Future <UpdateTestRecordsDataModel?> updtestData(String bloodP, String respRate, String oxygen, String heartbeat) async{
      var response = await http.put(Uri.http('localhost:8080','/api/updatetest/${testRecord.id}'), body: {
      
        "bloodPressure": bloodP,
        "respiratoryRate": respRate,
        "oxygenLevel": oxygen,
        "heartbeat": heartbeat
      });
      String responseString = response.body;

      if(response.statusCode == 200){
        
        uptTest = updateTestRecordsDataModelFromJson(responseString).data;
        
      } 
      else{
        
        return updateTestRecordsDataModelFromJson(responseString);
      }
  }

    void showAlert() {

      if( uptTest.bloodPressure == testRecord.bloodPressure){
        QuickAlert.show(context: context, 
        text: 'Record Updated!!',
        type: QuickAlertType.success);
      }else{
        QuickAlert.show(context: context, text:"Unable to update record!!" ,type: QuickAlertType.error);
      }
    
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController _bloodP = new TextEditingController();
  TextEditingController _respRate = new TextEditingController();
  TextEditingController _oxygen = new TextEditingController();
  TextEditingController _heartbeat = new TextEditingController();



  void clearText(){
    _bloodP.clear();
    _respRate.clear();
    _oxygen.clear();
    _heartbeat.clear();
  }


  @override
  void initState() {
    super.initState();
    _bloodP = new TextEditingController(text: testRecord.bloodPressure);
    _respRate = new TextEditingController(text: testRecord.respiratoryRate);
    _oxygen = new TextEditingController(text: testRecord.oxygenLevel);
    _heartbeat  = new TextEditingController(text: testRecord.heartbeat);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Update Test Details', style: TextStyle(color: Colors.white),),
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
                      controller: _respRate,
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
                  height: 80,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 18, 39, 8),
                      child:SizedBox( 
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() async{
                          String bloodP = _bloodP.text.toString();
                          String resp = _respRate.text.toString();
                          String oxygen = _oxygen.text.toString();
                          String heart = _heartbeat.text.toString();

                          updTestCallback([bloodP, resp, oxygen, heart]);

                          UpdateTestRecordsDataModel? data = await updtestData(bloodP, resp, oxygen, heart);

                          setState(() {
                            uptRecord = data;
                          });

                          showAlert();
                          clearText();

                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Update", textAlign: TextAlign.center),
                      ))
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(39, 18, 15, 8),
                      child:SizedBox( 
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { clearText },
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