import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pmed_app/Database/database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/medicament.dart';
var db =new Dbpfe();

List meds;
Medicament  med_search,med;
int  selected_id;
String Nom,Medi,Init,Minim,Maxi;
final bilan_cntrl = TextEditingController();
final med_cntrl = TextEditingController();
final clair_cntrl = TextEditingController();
final bilir_cntrl = TextEditingController();
final tg_cntrl = TextEditingController();


class ListeMed extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ListeMedstate();
  }

}

class ListeMedstate  extends State<ListeMed>{
  final chercher_med_ctrl = TextEditingController();


  @override
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    'Liste des médicaments',

  );
  Widget build(BuildContext context) {
    var dbmanager = new Dbpfe();
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color(0xffffae99),
       actions: <Widget>[
         IconButton(
           onPressed: () {
             setState(() {
               if (this.cusIcon.icon == Icons.search) {
                 this.cusIcon = Icon(Icons.cancel);
                 this.cusSearchBar = TextField(
                   controller: chercher_med_ctrl,
                   decoration:
                   InputDecoration(hintText: 'Chercher un médicament'),
                   textInputAction: TextInputAction.search,
                   onSubmitted: (term) async {





                     //si le med n existe pas on affiche ce alert message
                     med_search = await dbmanager.chercherMed(chercher_med_ctrl.text);

                     if (med_search == null) {
                       Alert(
                           context: context,
                           title: "Ce médicament n'existe pas",
                           desc: "vous devez le l'ajouter d'abord.")
                           .show();
                     } else {
                       for(int i = 0; i < meds.length; i++){

                         String nom=Medicament.fromMap(meds[i]).nombilan;
                         String medi=Medicament.fromMap(meds[i]).nom_med;
                         String init=Medicament.fromMap(meds[i]).consmin;
                         String minim=Medicament.fromMap(meds[i]).consmid;
                         String maxi=Medicament.fromMap(meds[i]).consmax;
                         Nom=nom;
                         Medi=medi;
                         Init=init;
                         Minim=minim;
                         Maxi=maxi;
                       }


                       selected_id = med_search.id_med;
                       


                       med = await dbmanager.getMed(selected_id);
                       
                       //=========================
                       med_search=null;
                       
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>Meddetail()));
                     }
                     
                     
                     
                     
                     
                     

                   },
                   style: TextStyle(color: Colors.white, fontSize: 16.0),
                 );
               } else {
                 this.cusIcon = Icon(Icons.search);
                 this.cusSearchBar = Text(
                   'Liste des médicaments',

                 );
               }
             });
           },
           icon: cusIcon,
         ),
       ],
       centerTitle: true,
       title: cusSearchBar,
     ),


     body:


     FutureBuilder(
       future: dbmanager.getAllMed(),
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           meds = snapshot.data;
           return _buildlistview();
         }
         return new CircularProgressIndicator();
       },
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         Navigator.push(context, MaterialPageRoute(
             builder: (context) => AddMed()
         ));
       },
       child: new Icon(
         Icons.add,
         size: 40,
       ),
       backgroundColor:  Color(0xffffae99),
       foregroundColor: Colors.white,
     ),
   );
  }
}

class Meddetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return MeddetailState();
  }
}

class MeddetailState extends State<Meddetail>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Détails du Médicaments'),
       backgroundColor: Color(0xffdf9c8f),
     ),
     body: ListView(
       children: [
         Padding(padding: EdgeInsets.all(85.0)),
      Container(
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
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(25.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Bilan demandé:",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
                Text("$Nom",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Nom du médicament:",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
                Text("$Medi",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Concentration initial:",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
                Text("$Init",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Concentration minimale:",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
                Text("$Minim",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Concentration maximale:",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
                Text("$Maxi",style: TextStyle(
                  fontSize: 20.0,color: Color(0xff1a1c1b),
                ),),
              ],
            ),
          ],
        ),

      )
       ],
     ),

   );
  }
}

class AddMed extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Addstate ();
  }

}

class Addstate extends State<AddMed> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color(0xffffae99),
     ),
     body:ListView(
       children: [
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: TextField(
             controller: bilan_cntrl,
             decoration: InputDecoration(
               labelText: 'bilan demandé',
             ),),
         ),

         Padding(
           padding: const EdgeInsets.all(25.0),
           child: TextField(
             controller: med_cntrl,
             decoration: InputDecoration(
               labelText: 'nom du médicament',
             ),),
         ),



         Padding(
           padding: const EdgeInsets.all(25.0),
           child: TextField(
             controller: clair_cntrl,
             decoration: InputDecoration(
               labelText: ' Concentration initiale',
             ),),




         ),
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: TextField(
             controller: bilir_cntrl,
             decoration: InputDecoration(
               labelText: 'Concentration minimale',
             ),),
         ),

         Padding(
           padding: const EdgeInsets.all(25.0),
           child: TextField(
             controller: tg_cntrl,
             decoration: InputDecoration(
               labelText: 'Concentration maximale',
             ),),
         ),


         GestureDetector(
           onTap: () async {

             await db.insertMedicament(new Medicament(med_cntrl.text,bilan_cntrl.text,clair_cntrl.text
             ,bilir_cntrl.text,tg_cntrl.text));


             Navigator.push(context, MaterialPageRoute(
                 builder: (context) => ListeMed()
             ));

           },

           child: Container(
             padding: new EdgeInsets.all(10.0),



             color: Color(0xff4fcab8),
             child: Center(
               child: Text("Sauvgarder",style:TextStyle(fontSize: 20.0,
                 fontWeight: FontWeight.w800,
                 color: Color(0xffffae99),)),
             ),
           ),

         )





       ],
     ) ,
   );
  }

}

ListView _buildlistview() {
  return ListView.builder(
      itemCount: meds == null ? 0 : meds.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffdf9c8f), width: 3),
            borderRadius: BorderRadius.circular(30),
          ),

          child: ListTile(
            title: Center(
              child: Text(
                'médicament : ${Medicament.fromMap(meds[position]).nom_med}', style: TextStyle(
                fontFamily: 'Caviar Dreams',
                fontWeight: FontWeight.w800,
                color: Color(0xff4fc9b8),
                fontSize: 23.0,

              ),

              ),
            ),


            subtitle: Column(
              children: [
                Text("Bilan demandé: ${Medicament.fromMap(meds[position]).nombilan}",style: TextStyle(
                  fontFamily: 'Caviar Dreams',
                  fontWeight: FontWeight.w800,
                  color: Color(0xff9a7671),
                  fontSize: 23.0,
                ),)
              ],
            ),

          ),
        );
      });
}