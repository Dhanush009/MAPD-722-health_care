import 'package:flutter/material.dart';
import 'package:health_care/components/addpatienttest.dart';
import 'package:health_care/components/updatepatient.dart';
import 'package:health_care/components/viewtest.dart';

class ViewPatient extends StatelessWidget {
  const ViewPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: const Text('Patient Info', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          automaticallyImplyLeading: true,
          leading: IconButton (icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),)
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
                  child: const Text("Bruno's Details ",
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
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePatient())) },
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
                    child: const Text('Bruno Fernandes',
                        style: TextStyle(
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
                    child: const Text('28',
                        style: TextStyle(
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
                    child: const Text('Male',
                        style: TextStyle(
                            fontSize: 22,fontWeight:FontWeight.bold),
                          textAlign: TextAlign.left),
                  ),

                ],),

                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('DOB:',
                        style: TextStyle(
                            fontSize: 22),
                          textAlign: TextAlign.left),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(2, 20, 15, 8),
                    alignment: Alignment.topLeft,
                    child: const Text('1994/05/28',
                        style: TextStyle(
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
                    child: const Text('Jose Sa',
                        style: TextStyle(
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
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPatientTest())) },
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
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewTestRecord())) },
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