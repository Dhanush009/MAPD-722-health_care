import 'package:flutter/material.dart';
import 'package:health_care/components/viewpatient.dart';
import 'package:health_care/model/patientdatamodel.dart';
import 'package:http/http.dart' as http;

 Future<PatientDataModel> getAllData() async{ 
    var response = await http.get(Uri.http('10.0.0.123:8090','/api/all'));

    if(response.statusCode == 200){
      
      String responseString = response.body;
      return patientDataModelFromJson(responseString);
      
    } 
    else{
      return patientDataModelFromJson(response.body);
    }
    
  }

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  static List<Datum> allPatientData = [];
  String _imag = '';
  List<Datum> display_list = [];

  @override
  void initState(){
    super.initState();
    getAllData().then((value) {
      setState(() {
        allPatientData = value.data;
        display_list = List.from(allPatientData);
      });

    });

  }


  String _setImage(String gend){

    if(gend == "Male"){
      _imag = 'assets/male.png';
    }else{
      _imag = 'assets/female.png';
    }

    return _imag;
  }

  void updateList (String value) {

    setState(() {
      display_list = allPatientData.where( (ele) => ele.firstname.toLowerCase().contains(value.toLowerCase())).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
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

              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(60, 188, 188, 188),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                  ),
                hintText: "eg: John Doe",
                prefixIcon: Icon(Icons.search),
                suffixIconColor: Color.fromARGB(255, 64, 95, 253)
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Expanded(
                child: display_list!.length == 0 ? Center( child: Text("No Result Found" , style: TextStyle(
                  color: Color.fromRGBO(0, 122, 122, 122),
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ))) :
                ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context,index) => ListTile(
                    onTap: () {
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPatient(id: display_list[index].id) ));
                    },
                    contentPadding: EdgeInsets.fromLTRB(14,8,14,8),
                    title: Text(display_list[index].firstname+" "+display_list[index].lastname, 
                    style: const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(display_list[index].department,style: TextStyle(color: Color.fromARGB(179, 89, 89, 89)),),
                    //trailing: Icon(display_list![index].condition == "Critical" ? Icons.warning : Icons.circle,color:display_list![index].condition == "Critical" ?  Colors.red : Color.fromARGB(255, 64, 115, 243)),
                    
                    leading: Image.asset(_setImage(display_list[index].gender))
                    ),
                )
                )

            ],
          ),
          ),

      ),
    );
  }
}