// ignore_for_file: deprecated_member_use, missing_return

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'Model/Ue.dart';
import 'Utils/Global.dart';

class Service {
  static String saveEtudiantUrl = '${root}/preinscription';
  static String saveUeUrl = '${root}/niveau';
  //static String saveNiveauUrl= '${root}/niveau';
  static String getClientUrl = '${root}/displayclient';

  static Future<String> saveEtudiant(
      nom,
      prenom,
      dateNaiss,
      lieuNaiss,
      sexe,
      adresse,
      adresseMail,
      numeroTelephone,
      numCni,
      langue,
      statutMatrimonial,
      statutProfessionel,
      nationalite,
      region,
      departement,
      nomPere,
      professionPere,
      nomMere,
      professionMere,
      nomTuteur,
      professionTuteur,
      nomUrgence,
      numUrgence,
      villeUrgence,
      firstChoice,
      secondChoice,
      thirdChoice,
      niveau,
      specialite,
      typeDiplome,
      anneeObtention,
      moyenne,
      matriculeDiplome,
      delivreurDiplome,
      dateDelivrance,
      sport,
      art,
      codePreinscription,
      numeroTransaction,
      photoEtudiant,
      photoReleveBac,
      photoReleveProbatoire,
      photoActenaissance,
      photoCni,
      photoRecuPaiement,
      infosJury,
      matricule,
      etat) async {
    try {
      var map = Map<String, dynamic>();
      map['name'] = nom.toString();
      map['surname'] = prenom.toString();
      map['dateNaiss'] = dateNaiss.toString();
      map['lieurNaiss'] = lieuNaiss.toString();
      map['numerocni'] = numCni.toString();
      map['photouser'] = photoEtudiant.toString();
      map['adresse'] = adresse.toString();
      map['sexe'] = sexe.toString();
      map['email'] = adresseMail.toString();
      map['statusMarital'] = statutMatrimonial.toString();
      map['langue'] = langue.toString();
      map['statusprofess'] = statutProfessionel.toString();
      map['numerotel'] = numeroTelephone.toString();
      map['nationalite'] = nationalite.toString();
      map['relevebac'] = photoReleveBac.toString();
      map['releveproba'] = photoReleveProbatoire.toString();
      map['actenaiss'] = photoActenaissance.toString();
      map['recu'] = photoRecuPaiement.toString();
      map['premierchoix'] = firstChoice.toString();
      map['deuxiemechoix'] = secondChoice.toString();
      map['troisiemechoix'] = thirdChoice.toString();
      map['specialite'] = specialite.toString();
      map['niveau'] = niveau.toString();
      map['dernierdiplom'] = typeDiplome.toString();
      map['anneeObtent'] = anneeObtention.toString();
      map['moyenne'] = moyenne.toString();
      map['matriculediplo'] = matriculeDiplome.toString();
      map['delivrepar'] = delivreurDiplome.toString();
      map['infojury'] = infosJury.toString();
      map['datedeliv'] = dateDelivrance.toString();
      map['nompere'] = nomPere.toString();
      map['professpere'] = professionPere.toString();
      map['nommere'] = nomMere.toString();
      map['professmere'] = professionMere.toString();
      map['nomtuteur'] = nomTuteur.toString();
      map['professtuteur'] = professionTuteur.toString();
      map['nomurgent'] = nomUrgence.toString();
      map['numerourgent'] = numUrgence.toString();
      map['villeurgent'] = villeUrgence.toString();
      map['sport'] = sport.toString();
      map['art'] = art.toString();
      map['codepreins'] = codePreinscription.toString();
      map['numeroTransaction'] = numeroTransaction.toString();
      map['matricule'] = matricule.toString();
      map['etat'] = etat.toString();

      print("My map $map");
      // saveEtudiantUrl = 'https://7068-41-202-207-3.ngrok-free.app/preinscription';
      print(saveEtudiantUrl);
      final response = await http.post(Uri.parse(saveEtudiantUrl), body: map);
      print('addEtudiant Response: ${response.statusCode}');
      print('addEtudiant Body: ${response.body}');

      if (200 == response.statusCode) {
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  static Future<String> saveEtudiant2(File photoUser) async {
    try {
      var map = Map<String, dynamic>();
      var stream = new http.ByteStream((photoUser.openRead()));
      var length = await photoUser.length();
      var photoUsers = http.MultipartFile('photouser', stream, length,
          filename: basename(photoUser.path));
      var relevebacs = http.MultipartFile('relevebac', stream, length,
          filename: basename(photoUser.path));
      var releveprobas = http.MultipartFile('releveproba', stream, length,
          filename: basename(photoUser.path));
      var actenaisss = http.MultipartFile('actenaiss', stream, length,
          filename: basename(photoUser.path));
      var recus = http.MultipartFile('recu', stream, length,
          filename: basename(photoUser.path));
      var request = http.MultipartRequest("POST", Uri.parse(saveEtudiantUrl));
      request.files.add(photoUsers);
      request.files.add(relevebacs);
      request.files.add(releveprobas);
      request.files.add(actenaisss);
      request.files.add(recus);
      request.fields['name'] = "Antony";
      request.fields['surname'] = "Marcial";
      request.fields['dateNaiss'] = "26/10/2000";
      request.fields['lieuNaiss'] = "Yaounde";
      request.fields['numerocni'] = "658CTBSL";
      //request.fields['photouser'] = photoEtudiant;
      request.fields['adresse'] = "Mendong";
      request.fields['sexe'] = "M";
      request.fields['email'] = "antony@gmail.com";
      request.fields['statusMarital'] = "Celibataire";
      request.fields['langue'] = "Francais";
      request.fields['statusprofess'] = "Etudiant";
      request.fields['numerotel'] = "6585214568";
      request.fields['nationalite'] = "Camerounais";
      request.fields['region'] = "centre";
      request.fields['departmt'] = "hong kam";
      //request.fields['relevebac'] = photoEtudiant;
      //request.fields['releveproba'] = photoEtudiant;
      //request.fields['actenaiss'] = photoEtudiant;
      //request.fields['recu'] = photoEtudiant;
      request.fields['premierchoix'] = "Infos";
      request.fields['deuxiemechoix'] = "physique";
      request.fields['troisiemechoix'] = "Chimie";
      request.fields['specialite'] = "gelo";
      request.fields['niveau'] = "1";
      request.fields['dernierdiplom'] = "Bac C";
      request.fields['anneeObtent'] = "2022";
      request.fields['moyenne'] = "18";
      request.fields['matriculediplo'] = "254769156";
      request.fields['delivrepar'] = "OBC";
      request.fields['infojury'] = "Admis";
      request.fields['Datedeliv'] = "24/10/2018";
      request.fields['nompere'] = "Gaston";
      request.fields['professpere'] = "Infos";
      request.fields['nommere'] = "Milene";
      request.fields['professmere'] = "Physicienne";
      request.fields['nomtuteur'] = "";
      request.fields['professtuteur'] = "";
      request.fields['nomurgent'] = "Gaston";
      request.fields['numerourgent'] = "685457521";
      request.fields['villeurgent'] = "yaounde";
      request.fields['sport'] = "true";
      request.fields['art'] = "false";
      request.fields['codepreins'] = "65284512556556";
      request.fields['numerotransaction'] = "65198991919566";
      //request.fields['photouser'] = photoEtudiant;

      print(saveEtudiantUrl);
      //print("la requete: ${request.headers}");
      print("Avant");
      var response = await request.send();
      print('addEtudiant Response: ${response.statusCode}');
      // print('addEtudiant Body: ${response.body}');

      if (200 == response.statusCode) {
        print("tout est ok");
        return "success";
      } else {
        print("pas bon");
        return "error";
      }
    } catch (e) {
      print(e);
      print("Vraiment pas bon");
      return "error";
    }
  }

  // static Future<String> addClient(String nom,String age)async{
  //   try{
  //     var map = Map<String, dynamic>();
  //     map['idclient'] = "250";
  //     map['nom'] = nom.toString();
  //     map['age'] = age.toString();

  //     print("Le map--------:$map");

  //      final response = await http.post(Uri.parse(saveClienUrl), body: map);
  //     print('addEtudiant Response: ${response.statusCode}');
  //     print('addEtudiant Body: ${response.body}');

  //     if (200 == response.statusCode) {
  //       return "success";
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     print(e);
  //     return "error";
  //   }
  // }

  static Future<String> addUe() async {
    try {
      var map = Map<String, dynamic>();
      Ue ue = Ue(id: 10, intitule: "ras", code: "inf3055", teacher: "null");

      map['name'] = "M2-DS";
      // map["ue"] = json.encode(ue.toMap());
      map["ue"] = "inf4077";
      map["intitule"] = "codage mobile";

      print("Le map--------:$map");

      final response = await http.post(
        Uri.parse(saveUeUrl),
        body: map,
      );
      print('addEtudiant Response: ${response.statusCode}');
      print('addEtudiant Body: ${response.body}');

      if (200 == response.statusCode) {
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  static Future<String> addUser() async {
    try {
      var map = Map<String, dynamic>();
      Ue ue = Ue(id: 10, intitule: "ras", code: "inf3055", teacher: "null");

      map['name'] = "M2-DS";
      // map["ue"] = json.encode(ue.toMap());
      map["ue"] = "inf4077";
      map["intitule"] = "codage mobile";

      print("Le map--------:$map");

      final response = await http.post(
        Uri.parse(saveUeUrl),
        body: map,
      );
      print('addEtudiant Response: ${response.statusCode}');
      print('addEtudiant Body: ${response.body}');

      if (200 == response.statusCode) {
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      print(e);
      return "error";
    }
  }

  // static Future<String> addNiveau()async{
  //   try{
  //     var map = Map<String, dynamic>();
  //     map['idue'] = "8";
  //     map['intitule']="L1";

  //     print("Le map--------:$map");

  //      final response = await http.post(Uri.parse(saveNiveauUrl), body: map);
  //     print('addEtudiant Response: ${response.statusCode}');
  //     print('addEtudiant Body: ${response.body}');

  //     if (200 == response.statusCode) {
  //       return "success";
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     print(e);
  //     return "error";
  //   }
  // }

  static Future<String> getClient() async {
    try {
      var map = Map<String, dynamic>();

      final response = await http.post(Uri.parse(getClientUrl), body: map);
      print("------------la reponse -------------------");
      print("response:: ${response.body}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
