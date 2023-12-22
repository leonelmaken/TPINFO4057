// ignore_for_file: deprecated_member_use, missing_return

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'Utils/Global.dart';

class Service {
  static String saveEtudiantUrl = '${root}/preinscription';   
  static String saveClienUrl = '${root}/client';                                                                             

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
      map['name'] = json.encode(nom);
      map['surname'] = json.encode(prenom);
      map['dateNaiss'] = json.encode(dateNaiss);
      map['lieurNaiss'] = json.encode(lieuNaiss);
      map['numerocni'] = json.encode(numCni);
      map['photouser'] = json.encode(photoEtudiant);
      map['adresse'] = json.encode(adresse);
      map['sexe'] = json.encode(sexe);
      map['email'] = json.encode(adresseMail);
      map['statusMarital'] = json.encode(statutMatrimonial);
      map['langue'] = json.encode(langue);
      map['statusprofess'] = json.encode(statutProfessionel);
      map['numerotel'] = json.encode(numeroTelephone);
      map['nationalite'] = json.encode(nationalite);
      map['relevebac'] = json.encode(photoReleveBac);
      map['releveproba'] = json.encode(photoReleveProbatoire);
      map['actenaiss'] = json.encode(photoActenaissance);
      map['recu'] = json.encode(photoRecuPaiement);
      map['premierchoix'] = json.encode(firstChoice);
      map['deuxiemechoix'] = json.encode(secondChoice);
      map['troisiemechoix'] = json.encode(thirdChoice);
      map['specialite'] = json.encode(specialite);
      map['niveau'] = json.encode(niveau);
      map['dernierdiplom'] = json.encode(typeDiplome);
      map['anneeObtent'] = json.encode(anneeObtention);
      map['moyenne'] = json.encode(moyenne);
      map['matriculediplo'] = json.encode(matriculeDiplome);
      map['delivrepar'] = json.encode(delivreurDiplome);
      map['infojury'] = json.encode(infosJury);
      map['datedeliv'] = json.encode(dateDelivrance);
      map['nompere'] = json.encode(nomPere);
      map['professpere'] = json.encode(professionPere);
      map['nommere'] = json.encode(nomMere);
      map['professmere'] = json.encode(professionMere);
      map['nomtuteur'] = json.encode(nomTuteur);
      map['professtuteur'] = json.encode(professionTuteur);
      map['nomurgent'] = json.encode(nomUrgence);
      map['numerourgent'] = json.encode(numUrgence);
      map['villeurgent'] = json.encode(villeUrgence);
      map['sport'] = json.encode(sport);
      map['art'] = json.encode(art);
      map['codepreins'] = json.encode(codePreinscription);
      map['numeroTransaction'] = json.encode(numeroTransaction);
      map['matricule'] = json.encode(matricule);
      map['etat'] = json.encode(etat);

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


  static Future<String> addClient(String nom,String age)async{
    try{
      var map = Map<String, dynamic>();
      map['nom'] = nom.toString();
      map['age'] = age.toString();

       final response = await http.post(Uri.parse(saveClienUrl), body: map);
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
}
