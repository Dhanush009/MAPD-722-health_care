import 'package:flutter/material.dart';
import '../model/doctor_model.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {

  static List<DoctorModel> doctors = [
    DoctorModel("Jose Sa","+1 6471234567" ,"Yes"),
    DoctorModel("De Bruyne","+1 6471234567" ,"Yes"),
    DoctorModel("Neymar","+1 6471234567" ,"No"),
    DoctorModel("Messi","+1 6471234567" ,"Yes"),
    DoctorModel("Mbappe","+1 6471234567" ,"No"),
    DoctorModel("Casemiro","+1 6471234567" ,"Yes"),
    DoctorModel("Kane","+1 6471234567" ,"No"),
    DoctorModel("Haaland","+1 6471234567" ,"No"),

  ];

  List<DoctorModel> display_list = List.from(doctors);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Available Doctors', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
        ),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 20,
              ),

              Expanded(
                child:ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context,index) => ListTile(
                    contentPadding: EdgeInsets.fromLTRB(14,8,14,8),
                    title: Text(display_list[index].doc_name!, 
                    style: const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(display_list[index].doc_num!,style: TextStyle(color: Color.fromARGB(179, 89, 89, 89)),),
                    trailing: Icon(Icons.circle,color:display_list[index].doc_avail == "No" ?  Colors.red : Colors.green),
                    ),
                )
            
                )
            ]
          ),
          ),

      ),
    );
  }
}