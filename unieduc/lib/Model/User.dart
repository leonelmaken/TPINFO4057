import 'dart:io';

import 'package:unieduc/Model/Ue.dart';

class User {
  int id;
  String userName;
  String email;
  String phoneNumber;
  String password;
  File photoProfil;
  static late  User instance;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.photoProfil,
    
  });

 static User getInstance() {
    return instance;
  } 

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json != null ? json['idUser'] : null,
      userName: json != null ? json['userName'] : null,
      email: json != null ? json['email'] : null,
      phoneNumber: json != null ? json['phoneNumber'] : null,
      password: json != null ? json['password'] : null,
      photoProfil: json != null ? json['photoProfil'] : null,
    );
  }

  // Map toMap() {
  //   var map = new Map<String, dynamic>();
  //   map['idNiveau'] = id;
  //   map['name'] = nom;

  //   return map;
  // }
}
