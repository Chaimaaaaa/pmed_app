import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmed_app/models/medicament.dart';

import 'Ui/bilan.dart';
import 'Ui/liste.dart';
String selected_item=null;

String Dose ,nomMed,nomBilan;
Medicament med1;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Start(),

  ));
}

class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       children: [
         Container(
           child: Column(
             children: [
               Image.asset('assets/docil.jpg'),
               Padding(padding: EdgeInsets.all(55.0)),
               Text("For an exeptionel Doctor",style:TextStyle(
                 fontSize: 35.0,
                 fontWeight: FontWeight.w800,
                 color: Color(0xffffae99),
               ),),
               Padding(padding: EdgeInsets.all(35.0)),
               GestureDetector(
                 onTap: (){{
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) => Menu()
                   ));
                 }
                 },

                 child: Container(
                   padding: new EdgeInsets.all(20.0),



                   color: Color(0xff4fcab8),
                   child: Text("Enter",style:TextStyle(fontSize: 20.0,
                     fontWeight: FontWeight.w800,
                     color: Color(0xffffae99),)),
                 ),

               )
             ],
           ),
         )
       ],
     ),
   );
  }

}

class Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return Menustate();
  }
}

class Menustate extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
  backgroundColor: Color(0xffffae99),
),
      body:Column(
        children: [
          Padding(padding: EdgeInsets.all(15.0)),
          CircleAvatar(
            radius: 100.0,
              child: Image.asset('assets/docil.jpg')
          ),
          Padding(padding: EdgeInsets.all(15.0)),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context) => ListeMed()
            ));},
            child: Container(
              padding: new EdgeInsets.all(30.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: [


                      Color(0xff4fc9b8),Color(0xff49c3b2),Color(0xff74b6b6),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  //color: Colors.yellow[100],
                  borderRadius: new BorderRadius.circular(50.0),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,offset: Offset(2,2)
                  )]
              ),
              child:Row(
                children: <Widget>[
                  Text("Liste des Médicament",style: TextStyle(

                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),),

                  Container(
                      margin: EdgeInsets.only(left: 90.0),
                      child:
                      Image.asset('assets/v.png',width: 60.0,)),
                ],
              ) ,
            ),
          ),


          Padding(padding: EdgeInsets.all(15.0)),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context) => Bilan()
            ));},
            child: Container(
              padding: new EdgeInsets.all(30.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: [


                      Color(0xfff8ae9c),Color(0xffdf9c8f),Color(0xff9a7671),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  //color: Colors.yellow[100],
                  borderRadius: new BorderRadius.circular(50.0),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,offset: Offset(2,2)
                  )]
              ),
              child:Row(
                children: <Widget>[
                  Text("Bilan Du Malade",style: TextStyle(

                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),),

                  Container(
                      margin: EdgeInsets.only(left: 140.0),
                      child:
                      Image.asset('assets/w.png',width: 60.0,)),
                ],
              ) ,
            ),
          )
        ],
      )


    );
  }
}



