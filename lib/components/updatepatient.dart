import 'package:flutter/material.dart';

class UpdatePatient extends StatefulWidget {
  const UpdatePatient({super.key});

  @override
  State<UpdatePatient> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {

  final formKey = GlobalKey<FormState>();

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
                        onPressed:() => { 0 },
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
                        onPressed:() => { 0 },
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