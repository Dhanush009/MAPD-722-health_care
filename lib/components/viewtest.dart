import 'package:flutter/material.dart';
import 'package:health_care/components/updatetest.dart';

class ViewTestRecord extends StatelessWidget {
  const ViewTestRecord({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: const Color.fromARGB(255, 64, 95, 253),
            height: 250,
            child: Column(children: [
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 90, 15, 8),
                  alignment:Alignment.center,
                  child: const Text("Bruno's Test Details ",
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
                        onPressed:() => { 0 },
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
                    child: const Text('120',
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
                    child: const Text('28',
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
                    child: const Text('98',
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
                    child: const Text('82',
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
                    child: const Text('2023/03/01',
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
                        onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePatientTest())) },
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