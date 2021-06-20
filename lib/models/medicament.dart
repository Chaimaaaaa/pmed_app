class Medicament{
  //les colones de table calcul





  int _id_med;
  String _nom_med;
  String _nombilan;
  String _consmax ;
  String _consmin ;
  String _consmid ;

  //un constructeur pour remplir le table
  Medicament(
      this._nom_med,
      this._nombilan,
      this._consmax,
      this._consmin,
      this._consmid,


      );
  Medicament.map(dynamic obj) {
    this._id_med = obj['id_med'];
    this._nom_med = obj['nom_med'];
    this._nombilan= obj['nombilan'];
    this._consmax= obj['consmax'];
    this._consmin= obj['consmin'];
    this._consmid= obj['consmid'];

  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_med => _id_med;
  String get nom_med => _nom_med;
  String get nombilan => _nombilan;
  String get consmin => _consmin;
  String get consmid => _consmid;
  String get consmax => _consmax;





  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id_med'] = _id_med;
    map['nom_med'] = _nom_med;
    map['nombilan '] = _nombilan ;
    map['consmin '] = _consmin;
    map['consmid'] = _consmid;
    map['consmax'] = _consmax;


    return map;
  }

  Medicament.fromMap(Map<String, dynamic> map) {
    this._id_med = map['id_med'];
    this._nom_med = map['nom_med'];
    this._nombilan= map['nombilan'];
    this._consmin = map['consmin'];
    this._consmid = map['consmid'];
    this._consmax = map['consmax'];

  }
}
