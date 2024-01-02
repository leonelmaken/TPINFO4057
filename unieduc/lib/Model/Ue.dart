// ignore_for_file: unnecessary_this

import 'dart:convert';

class Ue{

  int id;
  String intitule;
  String code;
  String teacher;
 // String idNiveau;
  

  Ue({
   required this.id,
   required this.intitule,
   required this.code,
   required this.teacher,
   //required this.idNiveau
  });

  factory Ue.fromJson(Map<String,dynamic> json){
    return Ue(
      
      id: json!=null?json['idue'] : null,
      intitule: json != null ? json['intitule']: null,
      code: json != null ? json['code']: null,
      teacher: json != null? json['teacher']:null,
     // idNiveau: json != null? json['idniveau']:null
      
      
      );
  }

  Map toMap(){
    var map = new Map<String,dynamic>();
    map['idue']=id;
    map['intitule']=intitule;
    map['code']=code;
    map['teacher']=teacher;
    //map['idniveau']=idNiveau;
    return map;
  }

  @override
  String toString(){
    return '${this.code} ${this.intitule} ${this.teacher}';
  }




}