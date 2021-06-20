import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmed_app/Ui/liste.dart';
import 'package:pmed_app/models/medicament.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Database/database.dart';
String   nom,  bilan;
var db =new Dbpfe();
List meds;
int  selected_idpati;
String selected_itempati;
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






  List<DropdownMenuItem> getDropDownItemp() {
    List<DropdownMenuItem<String>> dropdownitemsp = [];
    for (int i = 0; i < meds.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen
      String currency = Medicament.fromMap(meds[i]).nom_med;
      nom= Medicament.fromMap(meds[i]).nom_med;
      selected_idpati=Medicament.fromMap(meds[i]).id_med;
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
      appBar: AppBar(
        backgroundColor: Color(0xffffae99),
      ),


      body:ListView(
        children: [
          Column(

            children: [

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
                                    value: nom,
                                    onChanged: (value) async{
                                      setState(() {

                                        selected_itempati = value;
                                        print("selected: $value");

                                        for(int i=0;i<meds.length;i++) {


                                        }
                                      });

                                    },

                                  );


                                }}
                          )

                        ]
                    ),
                  )
              ),

              Padding(padding: EdgeInsets.all(40.0)),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                   controller: poidcntrl,
                   decoration: InputDecoration(
                   labelText: ' Le poids :',
                                               ),
                ),
              ),

              Padding(padding: EdgeInsets.all(15.0)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: claircntrl,
                  decoration: InputDecoration(
                    labelText: ' La clérence rénale :',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: bilicntrl,
                  decoration: InputDecoration(
                    labelText: ' La bilirubine:',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: tgcntrl,
                  decoration: InputDecoration(
                    labelText: 'Tgo/Tgp:',
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(15.0)),

              FloatingActionButton(
                onPressed: (){


                  setState(() {



                  });




    Alert(
                    context: context,
                    content: Column(
                      children: [
                        SizedBox(


                        ),
                        Text('La clairance rénale',style: TextStyle(
                          fontSize: 23.0,color: Color(0xff4fcab8),
                        ),),
                        Text('$Init',style: TextStyle(
                          fontSize: 20.0,
                        ),),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text('La bilrubine',style: TextStyle(
                          fontSize: 20.0,color: Color(0xff4fcab8),
                        ),),

                        Text('$Minim',style:TextStyle(
                          fontSize: 20.0,
                        ),),
                        SizedBox(
                          height: 23.0,
                        ),
                        Text('Tgo/Tgp',style: TextStyle(
                          fontSize: 20.0,color: Color(0xff4fcab8),
                        ),),

                        Text('$Maxi',style:TextStyle(
                          fontSize: 20.0,
                        ),),

                      ],
                    ),
                    title: "Dose à administrer",

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