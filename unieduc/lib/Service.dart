// ignore_for_file: deprecated_member_use, missing_return

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'Utils/Global.dart';

class Service {
  static String saveEtudiantUrl = '${root}/preinscription';   
  static String saveClienUrl = '${root}/registerclient';
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


  static Future<String> addClient(String nom,String age)async{
    try{
      var map = Map<String, dynamic>();
      map['idclient'] = "250";
      map['nom'] = nom.toString();
      map['age'] = age.toString();

      print("Le map--------:$map");

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
