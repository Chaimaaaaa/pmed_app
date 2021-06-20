import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/medicament.dart';

class Dbpfe {
  //cree une instance
  static final Dbpfe _instance = new Dbpfe.internal();

  factory Dbpfe() => _instance;
  static Database _db;
//la declaration des attributs des tableaux pour eviter de tamber en erreur d'ortographe
//tableau medicament=============================================
  final String tableMed = 'tableMedicament';
  final String columnId_med = 'id_med';
  final String columnNom = 'nom_med';
  final String nombilan= 'nombilan';
  final String consmax  = 'consmax ';
  final String consmin = 'consmin';
  final String consmid  = 'consmid';



  //fonction qui cree une db
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Dbpfe.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(
        documentDirectory.path, "maindb.db"); //home://directory/files/maindb.db
    var ourdb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourdb;
  }

  void _onCreate(Database db, int version) async {
    debugPrint('Database OnCreate');
    //table medicament
    await db.execute(
      "CREATE TABLE $tableMed($columnId_med INTEGER PRIMARY KEY , $columnNom TEXT ,$nombilan TEXT,"
          "$consmax TEXT , $consmin TEXT ,$consmid TEXT)",
    );
    debugPrint('table  medicament OnCreate');

    //table details clairance

  }
  //==============================CRUD MEDICAMENT1 ================================================================
//insirer fonction
  Future<int> insertMedicament(Medicament med) async {
    var dbMedicament = await db;
    int res = await dbMedicament.insert("$tableMed", med.toMap());

    return res;
  }

  //aficher tout les medicaments
  Future<List> getAllMed() async {
    var dbMedicament = await db;
    var result = await dbMedicament.rawQuery("SELECT * FROM $tableMed");
    return result.toList();
  }

  //afficher un medicament
  Future<Medicament> getMed(int id) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $columnId_med =$id");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }

  //chercher un medicament
  Future<Medicament> chercherMed(String nom) async {
    var dbMedicament = await db;
    var result = await dbMedicament
        .rawQuery("SELECT * FROM $tableMed WHERE $columnNom LIKE '$nom%' ");
    if (result.length == 0) return null;
    return new Medicament.fromMap(result.first);
  }}
