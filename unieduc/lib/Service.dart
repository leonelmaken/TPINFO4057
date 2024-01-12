// ignore_for_file: deprecated_member_use, missing_return

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:unieduc/Model/Message.dart';

import 'Model/Etudiant.dart';
import 'Model/Ue.dart';
import 'Model/User.dart';
import 'Utils/Global.dart';

class Service {
  static String saveEtudiantUrl = '${root}/preinscription';
  static String saveUeUrl = '${root}/niveau';
  static String saveNiveauUrl = '${root}/niveau';
  static String getClientUrl = '${root}/displayclient';
  static String addClientUrl = '${root}/registerclient';
  static String loginUrl = '${root}/login';
  static String createAccountUrl = '${root}/createAccount';
  static String inscriptionUrl = '${root}/api/inscriptionStudent';
  static String addAnnonceUrl = '${root}/api/annonce';
  static String getEtudiantUrl = '${root}/api/getEtudiant';

  static String saveMessageUrl = '${root}/api/messages/create';
  static String getMessageUrl = '${root}/api/messages/msg';
  static String getUserUrl = '${root}/listTeacher';

  //Geestion student-------------------------------------------------

//preincription uy1
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
      var request = http.MultipartRequest("POST", Uri.parse(saveEtudiantUrl));
      request.fields['name'] = nom.toString();
      request.fields['surname'] = prenom.toString();
      request.fields['dateNaiss'] = dateNaiss.toString();
      request.fields['lieuNaiss'] = lieuNaiss.toString();
      request.fields['sexe'] = sexe.toString();
      request.fields['numerocni'] = numCni.toString();
      request.fields['adresse'] = adresse.toString();

      request.fields['email'] = adresseMail.toString();
      request.fields['statusMarital'] = statutMatrimonial.toString();
      request.fields['langue'] = langue.toString();
      request.fields['statusprofess'] = statutProfessionel.toString();
      request.fields['numerotel'] = numeroTelephone.toString();
      request.fields['nationalite'] = nationalite.toString();
      request.fields['region'] = region.toString();
      request.fields['departmt'] = departement.toString();
      request.fields['premierchoix'] = firstChoice.toString();
      request.fields['deuxiemechoix'] = secondChoice.toString();
      request.fields['troisiemechoix'] = thirdChoice.toString();
      request.fields['specialite'] = specialite.toString();
      request.fields['niveau'] = niveau.toString();
      request.fields['dernierdiplom'] = typeDiplome.toString();
      request.fields['anneeObtent'] = anneeObtention.toString();
      request.fields['moyenne'] = moyenne.toString();
      request.fields['matriculediplo'] = matriculeDiplome.toString();
      request.fields['delivrepar'] = delivreurDiplome.toString();
      request.fields['infojury'] = infosJury.toString();
      request.fields['Datedeliv'] = dateDelivrance.toString();
      request.fields['nompere'] = nomPere.toString();
      request.fields['professpere'] = professionPere.toString();
      request.fields['nommere'] = nomMere.toString();
      request.fields['professmere'] = professionMere.toString();
      request.fields['nomtuteur'] = nomTuteur.toString();
      request.fields['professtuteur'] = professionTuteur.toString();
      request.fields['nomurgent'] = nomUrgence.toString();
      request.fields['numerourgent'] = numUrgence.toString();
      request.fields['villeurgent'] = villeUrgence.toString();
      request.fields['sport'] = sport.toString();
      request.fields['art'] = art.toString();
      request.fields['codepreins'] = codePreinscription.toString();
      request.fields['numerotransaction'] = numeroTransaction.toString();

      var photoUsers = http.MultipartFile(
          'photouser',
          http.ByteStream(photoEtudiant.openRead()),
          await photoEtudiant.length(),
          filename: "photoUser.jpg",
          contentType: MediaType('image', 'jpeg'));

      var relevebacs = http.MultipartFile(
          'relevebac',
          http.ByteStream(photoReleveBac.openRead()),
          await photoReleveBac.length(),
          filename: "releveBac.jpg",
          contentType: MediaType('image', 'jpeg'));
      var releveprobas = http.MultipartFile(
          'releveproba',
          http.ByteStream(photoReleveProbatoire.openRead()),
          await photoReleveProbatoire.length(),
          filename: "releveProba.jpg",
          contentType: MediaType('image', 'jpeg'));
      var actenaisss = http.MultipartFile(
          'actenaiss',
          http.ByteStream(photoActenaissance.openRead()),
          await photoActenaissance.length(),
          filename: "acteNaissance.jpg",
          contentType: MediaType('image', 'jpeg'));
      var recus = http.MultipartFile(
          'recu',
          http.ByteStream(photoRecuPaiement.openRead()),
          await photoRecuPaiement.length(),
          filename: "recuPaiement.jpg",
          contentType: MediaType('image', 'jpeg'));

      var photosCni = http.MultipartFile('photocni',
          http.ByteStream(photoCni.openRead()), await photoCni.length(),
          filename: "photoCni.jpg", contentType: MediaType('image', 'jpeg'));

      request.files.add(photoUsers);
      request.files.add(relevebacs);
      request.files.add(releveprobas);
      request.files.add(actenaisss);
      request.files.add(recus);
      request.files.add(photosCni);

      print(saveEtudiantUrl);
      print("Avant");
      var response = await request.send();
      print('addEtudiant statutCode: ${response.statusCode}');
      print('addEtudiant headers: ${response.headers}');
      print('addEtudiant reason: ${response.reasonPhrase}');
      print('addEtudiant persistance: ${response.persistentConnection}');

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

  //inscription uy1

  static Future<String> inscription(
      matricule,
      numTranche1,
      numTranche2,
      totalite,
      File firsttranche,
      File secondtranche,
      File totalitetranche) async {
    try {
      var map = Map<String, dynamic>();

      var request = http.MultipartRequest("POST", Uri.parse(inscriptionUrl));

      request.fields['matricule'] = matricule.toString();
      request.fields['numtranche1'] = numTranche1.toString();
      request.fields['numtranche2'] = numTranche2.toString();
      request.fields['numTotalite'] = totalite.toString();

      var firsttranches = http.MultipartFile('firsttranche',
          http.ByteStream(firsttranche.openRead()), await firsttranche.length(),
          filename: "firsttranche.jpg",
          contentType: MediaType('image', 'jpeg'));

      var secondtranches = http.MultipartFile(
          'secondtranche',
          http.ByteStream(secondtranche.openRead()),
          await secondtranche.length(),
          filename: "secondtranche.jpg",
          contentType: MediaType('image', 'jpeg'));
      var totalitetranches = http.MultipartFile(
          'totalitetranche',
          http.ByteStream(totalitetranche.openRead()),
          await totalitetranche.length(),
          filename: "totalitetranche.jpg",
          contentType: MediaType('image', 'jpeg'));

      request.files.add(firsttranches);
      request.files.add(secondtranches);
      request.files.add(totalitetranches);

      print(inscriptionUrl);
      print("Avant");
      var response = await request.send();
      print('addEtudiant statutCode: ${response.statusCode}');
      print('addEtudiant headers: ${response.headers}');
      print('addEtudiant reason: ${response.reasonPhrase}');
      print('addEtudiant persistance: ${response.persistentConnection}');

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

   static List<Etudiant> parseResponseEtudiant(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Etudiant>((json) => Etudiant.fromJson(json)).toList();
  }

  static Future<List<Etudiant>> getEtudiant() async {
    try {
      var map = Map<String, dynamic>();

      final response = await http.post(Uri.parse(getEtudiantUrl), body: map);

      print("response:: ${response.body}");
      if (response.statusCode == 200) {
        print('object');
        List<Etudiant> list = parseResponseEtudiant(response.body);
        return list;
      } else {
        return <Etudiant>[];
      }
    } catch (e) {
      return <Etudiant>[]; // return an empty list on exception/error
    }
  }

  //gestion des annonces----------------------------------------------------------

  static Future<String> addAnnonce(
    File image,
  ) async {
    try {
      var map = Map<String, dynamic>();

      var request = http.MultipartRequest("POST", Uri.parse(addAnnonceUrl));

      request.fields['title'] = "inscription Uy1";
      request.fields['content'] =
          "Il est possible de s'incrire avec 2000f au niveau de l'UY5";
      request.fields['timeStamp'] = "20/10/2023 12:15:12";

      var images = http.MultipartFile(
          'image', http.ByteStream(image.openRead()), await image.length(),
          filename: "image.jpg", contentType: MediaType('image', 'jpeg'));

      request.files.add(images);

      print(addAnnonceUrl);
      print("Avant");
      var response = await request.send();
      print('addEtudiant statutCode: ${response.statusCode}');
      print('addEtudiant headers: ${response.headers}');
      print('addEtudiant reason: ${response.reasonPhrase}');
      print('addEtudiant persistance: ${response.persistentConnection}');

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

  // static Future<String> incription(File photoUser, File releveBac,
  //     File releveProba, File acteNaiss, File recu, File phototCni) async {
  //   try {
  //     var map = Map<String, dynamic>();

  //     var request = http.MultipartRequest("POST", Uri.parse(saveEtudiantUrl));
  //     request.fields['name'] = "Antony";
  //     request.fields['surname'] = "Marcial";
  //     request.fields['dateNaiss'] = "26/10/2000";
  //     request.fields['lieuNaiss'] = "Yaounde";
  //     request.fields['numerocni'] = "658CTBSL";
  //     request.fields['adresse'] = "Mendong";
  //     request.fields['sexe'] = "M";
  //     request.fields['email'] = "antony@gmail.com";
  //     request.fields['statusMarital'] = "Celibataire";
  //     request.fields['langue'] = "Francais";
  //     request.fields['statusprofess'] = "Etudiant";
  //     request.fields['numerotel'] = "6585214568";
  //     request.fields['nationalite'] = "Camerounais";
  //     request.fields['region'] = "centre";
  //     request.fields['departmt'] = "hong kam";
  //     request.fields['premierchoix'] = "Infos";
  //     request.fields['deuxiemechoix'] = "physique";
  //     request.fields['troisiemechoix'] = "Chimie";
  //     request.fields['specialite'] = "gelo";
  //     request.fields['niveau'] = "M2-DS";
  //     request.fields['dernierdiplom'] = "Bac C";
  //     request.fields['anneeObtent'] = "2022";
  //     request.fields['moyenne'] = "18";
  //     request.fields['matriculediplo'] = "254769156";
  //     request.fields['delivrepar'] = "OBC";
  //     request.fields['infojury'] = "Admis";
  //     request.fields['Datedeliv'] = "24/10/2018";
  //     request.fields['nompere'] = "Gaston";
  //     request.fields['professpere'] = "Infos";
  //     request.fields['nommere'] = "Milene";
  //     request.fields['professmere'] = "Physicienne";
  //     request.fields['nomtuteur'] = "";
  //     request.fields['professtuteur'] = "";
  //     request.fields['nomurgent'] = "Gaston";
  //     request.fields['numerourgent'] = "685457521";
  //     request.fields['villeurgent'] = "yaounde";
  //     request.fields['sport'] = "true";
  //     request.fields['art'] = "false";
  //     request.fields['codepreins'] = "65284512556556";
  //     request.fields['numerotransaction'] = "65198991919566";

  //     var photoUsers = http.MultipartFile('photouser',
  //         http.ByteStream(photoUser.openRead()), await photoUser.length(),
  //         filename: "photoUser.jpg", contentType: MediaType('image', 'jpeg'));
  //     print("L'image: ${basename(photoUser.path)}");
  //     var relevebacs = http.MultipartFile('relevebac',
  //         http.ByteStream(releveBac.openRead()), await releveBac.length(),
  //         filename: "releveBac.jpg", contentType: MediaType('image', 'jpeg'));
  //     var releveprobas = http.MultipartFile('releveproba',
  //         http.ByteStream(releveProba.openRead()), await releveProba.length(),
  //         filename: "releveProba.jpg", contentType: MediaType('image', 'jpeg'));
  //     var actenaisss = http.MultipartFile('actenaiss',
  //         http.ByteStream(acteNaiss.openRead()), await acteNaiss.length(),
  //         filename: "acteNaissance.jpg",
  //         contentType: MediaType('image', 'jpeg'));
  //     var recus = http.MultipartFile(
  //         'recu', http.ByteStream(recu.openRead()), await recu.length(),
  //         filename: "recuPaiement.jpg",
  //         contentType: MediaType('image', 'jpeg'));

  //     var photoCni = http.MultipartFile('photocni',
  //         http.ByteStream(recu.openRead()), await phototCni.length(),
  //         filename: "photoCni.jpg", contentType: MediaType('image', 'jpeg'));

  //     request.files.add(photoUsers);
  //     request.files.add(relevebacs);
  //     request.files.add(releveprobas);
  //     request.files.add(actenaisss);
  //     request.files.add(recus);
  //     request.files.add(photoCni);

  //     print(saveEtudiantUrl);
  //     print("Avant");
  //     var response = await request.send();
  //     print('addEtudiant statutCode: ${response.statusCode}');
  //     print('addEtudiant headers: ${response.headers}');
  //     print('addEtudiant reason: ${response.reasonPhrase}');
  //     print('addEtudiant persistance: ${response.persistentConnection}');

  //     if (200 == response.statusCode) {
  //       print("tout est ok");
  //       return "success";
  //     } else {
  //       print("pas bon");
  //       return "error";
  //     }
  //   } catch (e) {
  //     print(e);
  //     print("Vraiment pas bon");
  //     return "error";
  //   }
  // }

  static Future<String> addClient(String nom, String age) async {
    try {
      var map = Map<String, dynamic>();
      map['idclient'] = "300";
      map['nom'] = nom.toString();
      map['age'] = age.toString();

      print("Le map--------:$map");

      final response = await http.post(Uri.parse(addClientUrl), body: map);
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

  //Gestion des Ue

  static Future<String> addUe(niveau, nomUe, intitule) async {
    try {
      var map = Map<String, dynamic>();

      map['name'] = niveau.toString();

      map["ue"] = nomUe.toString();
      map["intitule"] = intitule.toString();

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

//Gestion des utilisateurs ----------------------------------------------------------

  static Future<String> login(email, password) async {
    try {
      var map = Map<String, dynamic>();

      map['email'] = email.toString();

      map["password"] = password.toString();

      print("Le map--------:$map");

      final response = await http.post(
        Uri.parse(loginUrl),
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

  static Future<String> createAcount(userName,email,numerotel,matricule,password, File photoProfile) async {
    try {
      var map = Map<String, dynamic>();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(createAccountUrl),
      );

      request.fields['username'] = userName.toString();
      request.fields['email'] = email.toString();
      request.fields['numerotel'] = numerotel.toString();
      request.fields['matricule'] = matricule.toString();
      request.fields["password"] = password.toString();

      var stream = http.ByteStream(photoProfile.openRead());
      var length = await photoProfile.length();

      var multipartPP = http.MultipartFile('photouser', stream, length,
          filename: 'photoProfile.jpg',
          contentType: MediaType('image', 'jpeg'));

      request.files.add(multipartPP);

      print("Le map--------:$map");

      var response = await request.send();
      print('addUser Response: ${response.statusCode}');

      if (200 == response.statusCode) {
        print("c'est propre");
        return "success";
      } else {
        print("Pas bon");
        return "error";
      }
    } catch (e) {
      print("Vraiment pas bon");
      print(e);
      return "error";
    }
  }

  static List<User> parseResponseUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  static Future<List<User>> getAccount(type) async {
    try {
      var map = Map<String, dynamic>();
      getUserUrl = '${root}/listTeacher/${type.toString()}';

      print("L'url $getUserUrl");

      final response = await http.post(Uri.parse(getUserUrl), body: map);
      print("statut:${response.statusCode}");

      print("response:: ${response.body}");
      if (response.statusCode == 200) {
        print('object');
        List<User> list = parseResponseUser(response.body);
        return list;
      } else {
        return <User>[];
      }
    } catch (e) {
      return <User>[]; // return an empty list on exception/error
    }
  }





 

  //Gestion des messages

  static Future<String> addMessage2(File image) async {
    try {
      var map = Map<String, dynamic>();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(createAccountUrl),
      );

      request.fields['content'] = "bonjour";
      request.fields['time'] = "24/10/2023 11:14:13";
      request.fields['isSender'] = "658547885";
      request.fields['idReceiver'] = "20U2235";

      var stream = http.ByteStream(image.openRead());
      var length = await image.length();

      var multipartPP = http.MultipartFile('photouser', stream, length,
          filename: 'image.jpg', contentType: MediaType('image', 'jpeg'));

      request.files.add(multipartPP);

      print("Le map--------:$map");

      var response = await request.send();
      print('addUser Response: ${response.statusCode}');

      if (200 == response.statusCode) {
        print("c'est propre");
        return "success";
      } else {
        print("Pas bon");
        return "error";
      }
    } catch (e) {
      print("Vraiment pas bon");
      print(e);
      return "error";
    }
  }

  static Future<String> addMessage(content,date,senderId,senderName,receiverId,receiverName) async {
    try {
      var map = Map<String, dynamic>();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(saveMessageUrl),
      );

      request.fields['content'] = content.toString();
      request.fields['timestamp'] = date.toString();
      request.fields['senderId'] = senderId.toString();
      request.fields['senderName'] = senderName.toString();
      request.fields['receiverId'] = receiverId.toString();
      request.fields['receiverName'] = receiverName.toString();

      print("Le map--------:$map");

      // final response = await http.post(
      //   Uri.parse(saveMessageUrl),
      //   body: map,
      // );
      var response = await request.send();

      print('addEtudiant Response: ${response.statusCode}');

      if (200 == response.statusCode) {
        print("C'est propre");
        return "success";
      } else {
        print("pas propre");
        return "error";
      }
    } catch (e) {
      print("Tres sale");
      print(e);
      return "error";
    }
  }

   static List<Message> parseResponseMessage(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }

  static Future<List<Message>> getMessage(idSender, idReceiver) async {
    try {
      var map = Map<String, dynamic>();
      getMessageUrl = '${root}/api//messages/msg/$idSender/$idReceiver';

      print("L'url $getMessageUrl");

      final response = await http.post(Uri.parse(getMessageUrl), body: map);
      print("statut:${response.statusCode}");

      print("response:: ${response.body}");
      if (response.statusCode == 200) {
        print('object');
        List<Message> list = parseResponseMessage(response.body);
        return list;
      } else {
        return <Message>[];
      }
    } catch (e) {
      return <Message>[]; // return an empty list on exception/error
    }
  }

  
}
