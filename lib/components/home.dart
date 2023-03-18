import 'package:flutter/material.dart';
import 'package:health_care/components/addpatient.dart';
import 'package:health_care/components/navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 64, 95, 253),
              height: 400,
              child: Column(children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 140, 15, 8),
                  alignment:Alignment.center,
                  child: const Text('Ontario Health Care',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Image(
                    image: AssetImage('assets/healthcare.png'),
                    width: 180,
                    height: 180
                    
                  ),
                )
              ],)
              ),

              SizedBox(
                height: (MediaQuery.of(context).size.height) - 400,
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    alignment: Alignment.center,
                    child: SizedBox( 
                      width: 240,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:() => { Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPatient())) },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        elevation: 3,
                        backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                      ),
                      child: const Text('Add Patient', textAlign: TextAlign.center),
                    ))
                  ),
                 /* Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    alignment: Alignment.center,
                    child: SizedBox( 
                      width: 240,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:() => { 0 },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        elevation: 3,
                        backgroundColor: Color.fromARGB(255, 116, 187, 140),
                      ),
                      child: const Text('Search Patient', textAlign: TextAlign.center),
                    ))
                  ),
                  
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    alignment: Alignment.center,
                    child: SizedBox( 
                      width: 240,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:() => { 0 },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        elevation: 3,
                        backgroundColor: const Color.fromARGB(255, 116, 187, 140),
                      ),
                      child: const Text("Doctor's List", textAlign: TextAlign.center),
                    ))
                  )*/
                ]),
              ),

              
          ],
        ),
        
        ),
    );
  }
}