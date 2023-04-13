import 'package:flutter/material.dart';
import 'package:health_care/components/prviousrecords.dart';
import 'package:health_care/components/updatetest.dart';
import 'package:health_care/model/getpatientdatamodel.dart';
import 'package:http/http.dart' as http;
import '../model/patienttestrecordsdatamodel.dart';

class ViewRecord extends StatefulWidget {
  //const ViewRecord({super.key});
  late GetData patient;
  final String condition;
  final Function upCond;
  ViewRecord({super.key, required this.patient, required this.condition, required this.upCond});


  @override
  State<ViewRecord> createState() => _ViewRecordState(patient, condition, upCond);
}

class _ViewRecordState extends State<ViewRecord> {
  GetData patient;
  String condition;
  final Function uptCon;
  _ViewRecordState(this.patient, this .condition, this.uptCon);

  late RecordData data = RecordData(id: "", patientId: "", bloodPressure: "", respiratoryRate: "", oxygenLevel: "", heartbeat: "", date: "", v: 0);
  String bloodP="",resp="",oxy="",heart="";

   Future<PatientTestRecordsDataModel> getPatientTestData() async{ 
    var response = await http.get(Uri.http('10.0.0.123:8090','/api/onetestrecord/${patient.id}'));

    String responseString = response.body;

    if(response.statusCode == 200){
      return patientTestRecordsDataModelFromJson(responseString);
      
    } 
    else{
      return patientTestRecordsDataModelFromJson(responseString);
    }
    
  }

  void condUpt(String cond){
    setState(() {
      condition = cond;
      uptCon(condition);
    });
    
  }

  void updRecord(List data) {
    setState(() {
      bloodP = data[0];
      resp = data[1];
      oxy = data[2];
      heart = data[3];
    });
  }

  @override
  void initState(){
    super.initState();
    getPatientTestData().then((value){
      setState(() {
        data = value.data;
        bloodP = data!.bloodPressure;
        resp = data!.respiratoryRate;
        oxy = data!.oxygenLevel;
        heart = data!.heartbeat;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    print("INBUILD");
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text('Test Record', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          automaticallyImplyLeading: true,
          leading: IconButton (icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),)
        ),

        body: ListView(children: [
          Container(
            color: (condition == "Critical") ? Color.fromARGB(255, 254, 90, 78) : Color.fromARGB(255, 64, 95, 253),
            height: 250,
            child: Column(children: [
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 90, 15, 8),
                  alignment:Alignment.center,
                  child: Text("${patient.firstname}'s Test Details ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  
                ),
              
                Container(
                      margin: const EdgeInsets.fromLTRB(5, 18, 5, 8),
                      child:SizedBox( 
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => PreviousRecords(id: patient.id,))) },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Previous Records", textAlign: TextAlign.center),
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
                    child: const Text('Blood Pressure:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(bloodP,
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Respiratory Rate:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(resp,
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Blood Oxygen Level:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(oxy,
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('HeartBeat Rate:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(heart,
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('Date:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: Text(data.date,
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                

                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      alignment: Alignment.center,
                      child:SizedBox( 
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePatientTest(testRecord: data, updateTestData: updRecord, uptCond: condUpt,))) },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          elevation: 3,
                          backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                        ),
                        child: const Text("Edit Record", textAlign: TextAlign.center),
                      ))
                    )


                ],)
            
              )
        ],

        ),
 
        ));
  }
}