import 'package:unieduc/Model/Niveau.dart';

class Etudiant{

  int id; 
  String nom; 
  String prenom; 
  String dateNaiss; 
  String lieuNaiss; 
  String sexe; 
  String adresse;
  String adresseMail; 
  int numeroTelephone;
  String numCni;
  String langue;
  String statutMatrimonial;
  String statutProfessionel;

  String nationalite;
  String region;
  String departement;
  String nomPere;
  String professionPere;
  String nomMere;
  String professionMere;
  String nomTuteur;
  String professionTuteur;
  String nomUrgence;
  int numUrgence;
  String villeUrgence;

  String firstChoice;
  String secondChoice;
  String thirdChoice;
  Niveau niveau;
  String specialite;
  String typeDiplome;
  int anneeObtention;
  double moyenne;
  String matriculeDiplome;
  String delivreurDiplome;
  String dateDelivrance;
  bool sport;
  bool art;

  String codePreinscription;
  String numeroTransaction;
  String photoEtudiant;
  String photoReleveBac;
  String photoReleveProbatoire;
  String photoActenaissance;
  String photoCni;
  String photoRecuPaiement;
  String infosJury;

  

  int etat;


  Etudiant({
   required this.id,
   required this.nom,
   required this.prenom,
   required this.dateNaiss,
   required this.lieuNaiss,
   required this.sexe,
   required this.adresse,
   required this.adresseMail,
   required this.numeroTelephone,
   required this.langue,
   required this.numCni,
   required this.photoCni,
   required this.statutMatrimonial,
   required this.statutProfessionel,
   required this.nationalite,
   required this.region,
   required this.departement,
   required this.nomPere,
   required this.professionPere,
   required this.nomMere,
   required this.professionMere,
   required this.nomTuteur,
   required this.professionTuteur,
   required this.nomUrgence,
   required this.numUrgence,
   required this.villeUrgence,
   required this.firstChoice,
   required this.secondChoice,
   required this.thirdChoice,
   required this.typeDiplome,
   required this.anneeObtention,
   required this.matriculeDiplome,
   required this.moyenne,
   required this.infosJury,
   required this.delivreurDiplome,
   required this.dateDelivrance,
   required this.sport,
   required this.art,
   required this.codePreinscription,
   required this.numeroTransaction,
   required this.niveau,
   required this.specialite,
   required this.photoEtudiant,
   required this.photoReleveBac,
   required this.photoActenaissance,
   required this.photoReleveProbatoire,
   required this.photoRecuPaiement,
   required this.etat


  });

  factory Etudiant.fromJson(Map<String, dynamic> json) {
    
    return Etudiant(
      id: json['idUser'] as int ,
      nom: json['name'] as String,
      prenom: json['surname'] as String,
      dateNaiss: json['dateNaiss'] as String,
      lieuNaiss: json ['lieurNaiss'] as String,
      numCni: json['numerocni'] as String,
      photoEtudiant: json['photouser'] as String,
      adresse: json['adresse'] as String,
      sexe: json['sexe'] as String,
      adresseMail: json['email'] as String,
      statutMatrimonial: json['statusMarital'] as String,
      langue: json['langue'] as String,
      statutProfessionel: json['statusprofess'] as String,
      numeroTelephone: json['numerotel'] as int,
      nationalite: json['nationalite'] as String,
      region: json['region'] as String,
      departement: json['departmt'] as String,
      photoCni: json['nationalite'] as String,
      photoReleveBac: json['relevebac'] as String,
      photoReleveProbatoire: json['releveproba'] as String,
      photoActenaissance: json['actenaiss'] as String,
      photoRecuPaiement: json['recu'] as String,
      firstChoice: json['premierchoix'] as String,
      secondChoice: json['deuxiemechoix'] as String,
      thirdChoice: json['troisiemechoix'] as String,
      specialite: json['specialite'] as String,
      niveau:  Niveau.fromJson(json['niveau']),
      typeDiplome: json['dernierdiplom'] as String,
      anneeObtention: json ['anneeObtent'] as int,
      moyenne: json ['moyenne'] as double,
      matriculeDiplome: json['matriculediplo'] as String,
      delivreurDiplome: json ['delivrepar'] as String,
      infosJury: json['infojury'] as String,
      dateDelivrance: json['datedeliv'] as String,
      nomPere: json['nompere'] as String,
      professionPere: json['professpere'] as String,
      nomMere: json['nommere'] as String,
      professionMere: json['professmere'] as String,
      nomTuteur: json['nomtuteur'] as String,
      professionTuteur: json['professtuteur'] as String,
      nomUrgence: json['nomurgent'] as String,
      numUrgence: json['numerourgent'] as int,
      villeUrgence: json['villeurgent'] as String,
      sport: json['sport'],
      art: json['art'],
      codePreinscription: json['codepreins'] as String,
      numeroTransaction: json['numeroTransaction'] as String,
      etat: json['etat'] as int
    );
  }
















}