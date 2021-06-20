import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmed_app/Ui/liste.dart';
import 'package:pmed_app/main.dart';
import 'package:pmed_app/models/medicament.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Database/database.dart';
String     bilan,Dose;
var db =new Dbpfe();
List meds;
int  selected_idpati;
String selected_itempati;
final nompcntrl = TextEditingController();
final poidcntrl = TextEditingController();
final claircntrl = TextEditingController();
final bilicntrl = TextEditingController();
final tgcntrl = TextEditingController();
class Bilan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Bilanstate();
  }

}

class Bilanstate  extends State<Bilan>{

  String _chosenValue;




  List<DropdownMenuItem> getDropDownItemp() {
    List<DropdownMenuItem<String>> dropdownitemsp = [];
    for (int i = 0; i < meds.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen
      String currency = Medicament.fromMap(meds[i]).nom_med;

      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitemsp.add(newItem);
    }
    return dropdownitemsp;
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dose Administer"),
        backgroundColor: Color(0xffffae99),
      ),


      body:ListView(
        children: [
          Column(

            children: [Padding(padding: EdgeInsets.all(40.0)),


              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: nompcntrl,
                  decoration: InputDecoration(
                    labelText: ' Nom et prenom de pation :',
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: poidcntrl,
                  decoration: InputDecoration(
                    labelText: ' Le poids :',
                  ),
                ),
              ),


              Padding(padding: EdgeInsets.all(25.0)),
              Container(
                  padding: new EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        colors: [

                          Color(0xfff8ae9c),Color(0xffdf9c8f),Color(0xff9a7671),


                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      //color: Colors.yellow[100],
                      borderRadius: new BorderRadius.circular(27.0),
                      boxShadow: [BoxShadow(

                          color: Colors.grey,offset: Offset(2,2)
                      )]


                  ),



                  child:  SizedBox(
                    height: 35.0,
                    width: 340.0,

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Choisir un Médicament:",style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xffF2F2F2),
                            fontSize: 15.0,
                            fontFamily: 'Caviar Dreams',
                          ),),

                          FutureBuilder(


                              future: db. getAllMed(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  meds = snapshot.data;
                                  return DropdownButton<String>(


                                    items: getDropDownItemp(),
                                    value:selected_item,
                                    onChanged: (value) async {
                                      setState(()  {
                                        selected_item = value;
                                        nomMed=selected_item;
                                        print(' selected item $selected_item');

                                      });  med1=await db.chercherMed(selected_item);
                                      nomBilan=med1.nombilan;
                                    });


                                }}
                          )

                        ]
                    ),
                  )
              ),


              Padding(padding: EdgeInsets.all(15.0)),
              DropdownButton<String>(
                value: _chosenValue,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                dropdownColor: Color(0xffffae99),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                items: <String>['<30 n/p', '>30 n/p et <60 n/p', '>60 n/p'].map<DropdownMenuItem<String>>((String value) {

                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    _chosenValue = newValue;
                    if (_chosenValue == '<30 n/p') {
                      print("One");
                      Dose=med1.consmin;
                    }
                    if (_chosenValue == '>60 n/p') { print("Two");
                    Dose=med1.consmid;
                    print("$Dose");}
                    if (_chosenValue == '>30 n/p et <60 n/p') { print("Three");
                    Dose=med1.consmax;}
                  });
                },

                hint: Text(
                  "choisir concetration:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              ),

              Padding(padding: EdgeInsets.all(15.0)),


              Padding(padding: EdgeInsets.all(15.0)),
//rrrrr
              FloatingActionButton(
                onPressed: (){


                  setState(() {



                  });




    Alert(
                    context: context,
                    content: Column(
                      children: [
                        Text('Dose à administrer',style: TextStyle(
                          fontSize: 25.0,color: Color(0xffffae99),
                        ),), SizedBox(
                          height: 25.0,
                        ),
                        Text('nom medicament',style: TextStyle(
                          fontSize: 23.0,color: Color(0xff4fcab8),
                        ),),
                        Text('$nomMed',style: TextStyle(
                          fontSize: 20.0,
                        ),),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text('nom bilan',style: TextStyle(
                          fontSize: 20.0,color: Color(0xff4fcab8),
                        ),),

                        Text('$nomBilan',style:TextStyle(
                          fontSize: 20.0,
                        ),),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text('La Dose :',style: TextStyle(
                          fontSize: 20.0,color: Color(0xff4fcab8),
                        ),),

                        Text('$Dose',style:TextStyle(
                          fontSize: 20.0,
                        ),),

                      ],
                    ),
                   title: ""

                  )
                      .show();


                },
                child: new Icon(
                  Icons.check,
                  size: 40,
                ),
                backgroundColor: Color(0xff4fcab8),
                foregroundColor: Colors.white,
              )






            ],
          ),
        ],
      )
    );
  }
}