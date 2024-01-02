import 'package:unieduc/Model/Ue.dart';

class Niveau{

int id;
int nom;


Niveau({
 required this.id,
 required this.nom,
 
});

factory Niveau.fromJson(Map<String,dynamic> json){
    return Niveau(
      
      id: json!=null?json['idNiveau'] : null,
      nom: json != null ? json['name']: null,

      
      );
  }

  Map toMap(){
    var map = new Map<String,dynamic>();
    map['idNiveau']=id;
    map['name']=nom;
   
    return map;
  }



}