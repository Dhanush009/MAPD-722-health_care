import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:health_care/model/previousrecdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PreviousRecords extends StatefulWidget {
  //const PreviousRecords({super.key});
  late String id;
  PreviousRecords({super.key, required this.id});

  @override
  State<PreviousRecords> createState() => _PreviousRecordsState();
}

class _PreviousRecordsState extends State<PreviousRecords> {
  //late String id;

  Future<PreviousRecordsDataModel> getAllRecords() async{
    var response = await http.get(Uri.http('10.0.0.123:8090','/api/testrecord/${widget.id}'));

    String responseString = response.body;

    if(response.statusCode == 200){
      return previousRecordsDataModelFromJson(responseString);
      
    } 
    else{
      return previousRecordsDataModelFromJson(responseString);
    }
  }

  static List<PreviousRec> recs = [];
  List<PreviousRec> displayRec = [];
  @override
  void initState(){
    super.initState();
    getAllRecords().then((value) {
      setState(() {
        recs = value.data;
        displayRec = List.from(recs);
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Previous Test Records', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 64, 95, 253),
          automaticallyImplyLeading: true,
          leading: IconButton (icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),)
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
                child: displayRec!.length == 0 ? Center( child: Text("No Result Found" , style: TextStyle(
                  color: Color.fromRGBO(0, 122, 122, 122),
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ))) :
                ListView.separated(
                  padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
                  itemCount: displayRec.length,
                  itemBuilder: (context,index) => ListTile(
                    
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(255, 210, 210, 210), width: 2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    contentPadding: EdgeInsets.fromLTRB(14,8,14,8),
                    title: Text(displayRec[index].date, 
                    style: const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text("Blood Pressure: ",
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                            Text(displayRec[index].bloodPressure,
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                          ],
                        ),

                        Row(
                          children: [
                            Text("Respiratory Rate: ",
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                            Text(displayRec[index].respiratoryRate,
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                          ],
                        ),

                        Row(
                          children: [
                            Text("Oxygen Level: ",
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                            Text(displayRec[index].oxygenLevel,
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                          ],
                        ),

                        Row(
                          children: [
                            Text("Heartbeat: ",
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                            Text(displayRec[index].heartbeat,
                            style: TextStyle(color: Color.fromARGB(179, 89, 89, 89),fontSize: 16, fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ],
                    )
                    
                    
                  
                    ),
                    separatorBuilder:(context, index) => const Divider(),
                  
                )
                )

            ],
          ),
          ),

      ),
    );
  }
}