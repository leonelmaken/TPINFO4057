import 'package:unieduc/Model/Ue.dart';

class Niveau{

int id;
int nom;
Ue ue;

Niveau({
 required this.id,
 required this.nom,
  required this.ue,
});

factory Niveau.fromJson(Map<String,dynamic> json){
    return Niveau(
      
      id: json!=null?json['idNiveau'] : null,
      nom: json != null ? json['name']: null,
      ue: Ue.fromJson(json['eu'])
      
      
      );
  }

  Map toMap(){
    var map = new Map<String,dynamic>();
    map['idNiveau']=id;
    map['name']=nom;
    map['eu']=ue;
   
    return map;
  }



}