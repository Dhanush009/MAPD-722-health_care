import 'package:flutter/material.dart';
import 'package:health_care/model/getpatientdatamodel.dart';
import '../model/patientdatamodel.dart';
import '../model/updpatientdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class UpdatePatient extends StatefulWidget {
  //const UpdatePatient({super.key});
  late GetData patient;
  final Function updateCallback;
  UpdatePatient({super.key,required this.patient, required this.updateCallback});

  @override
  State<UpdatePatient> createState() => _UpdatePatientState(patient, updateCallback);
}

class _UpdatePatientState extends State<UpdatePatient> {

  GetData patient;
  final Function updCallback;

  _UpdatePatientState(this.patient, this.updCallback);
  
  

  UptPatientDataModel? patientModel;
  late UptPatientData uptPatient = UptPatientData(id: "", firstname: "", lastname: "", gender: "", age: "", doctor: "", department: "", v: 0);

  final formKey = GlobalKey<FormState>();

  TextEditingController _age = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _doc = TextEditingController();
  TextEditingController _dept = TextEditingController();

   Future<UptPatientDataModel?> uptPatientData( String age, String gender, String doc, String dept) async{ 
    var response = await http.put(Uri.http('localhost:8080','/api/updatepatient/${patient.id}'), body: {
      
      "gender": gender,
      "age": age,
      "doctor": doc,
      "department": dept
    });

    String responseString = response.body;

    if(response.statusCode == 200){
      
       uptPatient = uptPatientDataModelFromJson(responseString).data;
      
    } 
    else{
      
      return uptPatientDataModelFromJson(responseString);
    }
  }

    void showAlert() {

      if( uptPatient.firstname == patient.firstname){
        QuickAlert.show(context: context, 
        text: 'Patient Updated!!',
        type: QuickAlertType.success);
      }else{
        QuickAlert.show(context: context, text:"Unable to update patient!!" ,type: QuickAlertType.error);
      }
    
  }

   void clearText() {
    _age.clear();
    _gender.clear();
    _doc.clear();
    _dept.clear();
  }

  @override
  void initState() {
    super.initState();
    _age = new TextEditingController(text: patient.age);
    _gender = new TextEditingController(text: patient.gender);
    _doc = new TextEditingController(text: patient.doctor);
    _dept = new TextEditingController(text: patient.department);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Update Patient', style: TextStyle(color: Colors.white),),
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
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value!)){
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
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value!)){
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
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value!)){
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
                      if(value!.isEmpty || !RegExp(r'^[a-z][A-Z]+$').hasMatch(value!)){
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
                        onPressed:() async { 
                          
                          String age = _age.text.toString();
                          String gender = _gender.text.toString();
                          String doctor = _doc.text.toString();
                          String department = _dept.text.toString();

                          updCallback([age, gender, doctor, department]);

                          UptPatientDataModel? data = await uptPatientData( age, gender, doctor, department);

                          setState(() {
                            patientModel = data;
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