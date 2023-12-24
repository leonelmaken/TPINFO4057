import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:unieduc/Model/Niveau.dart';
import 'package:unieduc/Screen/AttenteValidation.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/NavCircle.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class Preinscription extends StatefulWidget {
  @override
  _PreinscriptionState createState() => _PreinscriptionState();
}

class _PreinscriptionState extends State<Preinscription> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final sexeList = ['MASCULIN', 'FEMININ', 'NON PRECISE'];
  var selectedSexe;
  bool? _sexeMasculin = false;
  bool? _sexeFeminin = false;
  String _sexe = "Masculin";
  bool _okSport = false;
  bool _okArt = false;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final _currentPageNotifier = ValueNotifier<int>(0);
  //final _pageViewIndicatorKey = PageView();

  late final List<String> _listNiveau = [
    'Licence 1',
    'Licence 2 ',
    'Licence 3',
    'Master 1',
    'Master 2'
  ];
  String? selectedNiveau;

  late final List<String> _listFiliere = [
    'Infos',
    'Ict',
    'Physique',
    'Chimie',
    'Maths',
    'Bios'
  ];
  String? selectedFirstChoice;
  String? selectedSecondChoice;
  String? selectedThirdChoice;

  late final List<String> _listSpecialite = [
    'Geni Logiciel',
    'Data Science',
    'SE et Reseau',
    'Securite Reseau',
  ];
  String? selectedSpecialite;

  late final List<String> _listStatutMatrimonial = [
    'Celibataire',
    'Marié',
    'Divorce',
  ];
  String? selectedStatutMatrimonial;

  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _dateNaissController = new TextEditingController();
  TextEditingController _lieuNaissController = new TextEditingController();
  TextEditingController _regionOrigineController = new TextEditingController();
  TextEditingController _nationaliteController = new TextEditingController();
  TextEditingController _matriculeController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  TextEditingController _specialiteController = new TextEditingController();
  TextEditingController _anneeAcademiqueController =
      new TextEditingController();
  TextEditingController _noTransacController = new TextEditingController();
  TextEditingController _noDeuxTranchController = new TextEditingController();
  TextEditingController _noTotaliteController = new TextEditingController();
  TextEditingController _noTelController = new TextEditingController();
  TextEditingController _dateDelController = new TextEditingController();
  TextEditingController _adresseController = new TextEditingController();
  TextEditingController _numRecuController = new TextEditingController();
  TextEditingController _adressemailController = new TextEditingController();
  TextEditingController _numCniCoontroller = new TextEditingController();
  TextEditingController _langueCoontroller = new TextEditingController();
  TextEditingController _statutMatrimonialController =
      new TextEditingController();
  TextEditingController _statutProfesssionelController =
      new TextEditingController();
  TextEditingController _departementController = new TextEditingController();
  TextEditingController _nomPereController = new TextEditingController();
  TextEditingController _professionPereController = new TextEditingController();
  TextEditingController _nomMereController = new TextEditingController();
  TextEditingController _professionMereController = new TextEditingController();
  TextEditingController _nomTuteurController = new TextEditingController();
  TextEditingController _professionTuteurController =
      new TextEditingController();
  TextEditingController _nomUrgenceController = new TextEditingController();
  TextEditingController _numUrgenceController = new TextEditingController();
  TextEditingController _villeUrgenceController = new TextEditingController();
  TextEditingController _firstChoiceController = new TextEditingController();
  TextEditingController _secondChoiceController = new TextEditingController();
  TextEditingController _thirdChoiceController = new TextEditingController();
  TextEditingController _typediplomeController = new TextEditingController();
  TextEditingController _anneObtentionController = new TextEditingController();
  TextEditingController _moyenneController = new TextEditingController();
  TextEditingController _matriculeDiplomeController =
      new TextEditingController();
  TextEditingController _delivreurDiplomeController =
      new TextEditingController();

  final _formKeyPreInscriptionUy1 = GlobalKey<FormState>();

  File? releveBac = null;
  File? releveProbatoire = null;
  File? acteNaissance = null;
  File? photo4x4 = null;
  File? photoCNI = null;
  File? photoRecu = null;

  Future<File?> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    File imageFile = File(image.path);

    return imageFile;
  }

  saveEtudiant() async {
    String nom = _nomController.text.trim();
    String prenom = _prenomController.text.trim();
    String dateNaiss = _dateNaissController.text.trim();
    String lieuNaiss = _lieuNaissController.text.trim();
    String sexe = _sexe;
    String adresse = _adresseController.text.trim();
    String adresseMail = _adressemailController.text.trim();
    int numeroTelephone = int.parse(_noTelController.text.trim());
    String numCni = _numCniCoontroller.text.trim();
    String langue = _langueCoontroller.text.trim();
    String statutMatrimonial = selectedStatutMatrimonial!;
    String statutProfessionel = _statutProfesssionelController.text.trim();

    String nationalite = _nationaliteController.text.trim();
    String region = _regionOrigineController.text.trim();
    String departement = _departementController.text.trim();
    String nomPere = _nomPereController.text.trim();
    String professionPere = _professionPereController.text.trim();
    String nomMere = _nomMereController.text.trim();
    String professionMere = _professionMereController.text.trim();
    String nomTuteur = _nomTuteurController.text.trim();
    String professionTuteur = _professionTuteurController.text.trim();
    String nomUrgence = _nomUrgenceController.text.trim();
    int numUrgence = int.parse(_numUrgenceController.text.trim());
    String villeUrgence = _villeUrgenceController.text.trim();

    String firstChoice = selectedFirstChoice!;
    String secondChoice = selectedSecondChoice!;
    String thirdChoice = selectedThirdChoice!;
    // Niveau niveau=;
    String niveau = "1";
    String specialite = _specialiteController.text.trim();
    String typeDiplome = _typediplomeController.text.trim();
    int anneeObtention = int.parse(_anneObtentionController.text.trim());
    double moyenne = double.parse(_moyenneController.text.trim());
    String matriculeDiplome = _matriculeDiplomeController.text.trim();
    String delivreurDiplome = _delivreurDiplomeController.text.trim();
    String dateDelivrance = _dateDelController.text.trim();
    bool sport = _okSport;
    bool art = _okArt;

    String codePreinscription = '123456';
    String numeroTransaction = _noTransacController.text.trim();
    String photoEtudiant = 'tofetudiant';
    String photoReleveBac = 'tofReleveBac';
    String photoReleveProbatoire = 'tofReleveProba';
    String photoActenaissance = 'TofActenaissance';
    String photoCni = 'tofCni';
    String photoRecuPaiement = 'tofRecuPaiement';
    String infosJury = 'admis';
    String matricule = '20V3285';
    int etat = 0;

    await Service.saveEtudiant(
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
            etat)
        .then((result) {
      if ('success' == result) {
        print('OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK');
      } else {
        print("noooooooooooooooooooooooooo");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SECONDARY_COLOR,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            PRIMARY_COLOR,
                            Color.fromARGB(255, 38, 83, 129)
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                )),
                Expanded(child: Container()),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 70),
            //   child: Wrap(
            //     alignment: WrapAlignment.center,
            //     children: [
            //       Column(
            //         children: [
            //           const SizedBox(
            //             height: 50,
            //           ),
            // const Text(
            //   "PRE-INSCRIPTION UY1",
            //   style: TextStyle(
            //     fontSize: 40,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            //           const SizedBox(
            //             height: 100,
            //           ),
            ScrollableWidget(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "PRE-INSCRIPTION UY1",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Form(
                      key: _formKeyPreInscriptionUy1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Navcircle(
                                  index: 0,
                                  currentPage:
                                      _currentPage), // Cercle pour le premier mini-écran
                              const SizedBox(width: 15.0),
                              Navcircle(index: 1, currentPage: _currentPage),
                              const SizedBox(width: 15.0),
                              Navcircle(index: 2, currentPage: _currentPage),
                              const SizedBox(width: 15.0),
                              Navcircle(index: 3, currentPage: _currentPage),
                              const SizedBox(width: 15.0),
                              Navcircle(index: 4, currentPage: _currentPage),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                          const SizedBox(
                    height: 10,
                  ),
                          Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 15,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 400,
                              height: 600,
                              // constraints:
                              //     const BoxConstraints(minHeight: 50, maxHeight: 800),
                              child: PageView(
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ScrollableWidget(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Etat-Civil",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nom",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _nomController,
                                                  autofocus: true,
                                                  maxLength: 30,
                                                  inputFormatters: const [],
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  },
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",
                                                      hintText:
                                                          'Entrer votre nom',
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      //labelText: "Nom",
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Prenom",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _prenomController,
                                                  autofocus: true,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  onFieldSubmitted: (value) {
                                                    FocusScope.of(context)
                                                        .nextFocus();
                                                  },
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",
                                                      //labelText: "Prenom",
                                                      hintText:
                                                          'Entrer votre prenom',
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Date de naissance",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _dateNaissController,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1950),
                                                            //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime(2100));

                                                    if (pickedDate != null) {
                                                      // print(
                                                      //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                      String formattedDate =
                                                          //DateFormat('yyyy-MM-dd')
                                                          DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  pickedDate);
                                                      // print(
                                                      //     formattedDate); //formatted date output using intl package =>  2021-03-16
                                                      setState(() {
                                                        _dateNaissController
                                                                .text =
                                                            formattedDate; //set output date to TextField value.
                                                      });
                                                    } else {}
                                                  },
                                                  readOnly: true,
                                                  keyboardType:
                                                      TextInputType.datetime,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      //labelText: "Date naissance",
                                                      hintText:
                                                          'Cliquer pour choisir une date de naissance',
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      prefixIcon: const Icon(
                                                          Icons.event),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Lieu de naissance",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _lieuNaissController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",
                                                      // labelText:
                                                      //     "Lieu de naissance",
                                                      hintText:
                                                          "Entrer le lieu de naissance",
                                                      prefixIcon: const Icon(
                                                          Icons.location_on),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Sexe",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: 400,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 0.5),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: Column(children: [
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Radio(
                                                      value: "Masculin",
                                                      groupValue: _sexe,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _sexe =
                                                              value.toString();
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Masculin',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),

                                                  Radio(
                                                      value: "Feminin",
                                                      groupValue: _sexe,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _sexe =
                                                              value.toString();
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Feminin',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  // DropdownButtonFormField<String>(
                                                  //   value: selectedSexe,
                                                  //   icon: const Icon(
                                                  //     Icons.arrow_drop_down,
                                                  //     size: 30,
                                                  //   ),
                                                  //   items: sexeList.map((String item) {
                                                  //     return DropdownMenuItem(
                                                  //         value: item, child: Text(item));
                                                  //   }).toList(),
                                                  //   onChanged: (String? value) {
                                                  //     setState(() {
                                                  //       selectedSexe = value!;
                                                  //     });
                                                  //   },
                                                  // )
                                                ],
                                              )
                                            ])),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Adresse mail",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _adressemailController,
                                                  maxLength: 30,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre adresse mail",
                                                      prefixIcon: const Icon(
                                                          Icons.email),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Numero telephone",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _noTelController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre numero de telephone",
                                                      prefixIcon: const Icon(
                                                          Icons.phone),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Langue Parlée",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _langueCoontroller,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre langue",
                                                      prefixIcon: const Icon(
                                                          Icons.language),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Adresse",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _adresseController,
                                                  maxLength: 30,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre adresse, exple:Mendong,Yaonde",
                                                      prefixIcon: const Icon(
                                                          Icons.email),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Statut matrimonial",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: 400,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 0.5),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: Column(
                                              children: [
                                                DropdownButtonFormField(
                                                    value:
                                                        selectedStatutMatrimonial,
                                                    validator:
                                                        (String? value2) {
                                                      value2 =
                                                          selectedStatutMatrimonial;
                                                      if (value2!.isEmpty) {
                                                        return 'veuillez remplir ce champs';
                                                      }
                                                    },
                                                    items:
                                                        _listStatutMatrimonial
                                                            .map((String item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item,
                                                        child: Text(item,
                                                            style: const TextStyle(
                                                                color:
                                                                    TEXT_COLOR,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newValue) {
                                                      selectedStatutMatrimonial =
                                                          newValue;
                                                    },
                                                    hint: Text(
                                                      "Selectionner statut matrimonial",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade600,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    decoration: const InputDecoration(
                                                        prefixIcon: Icon(
                                                            Icons.book),
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none))),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Statut professionnel",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _statutProfesssionelController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre statut professsionel",
                                                      prefixIcon: const Icon(Icons
                                                          .add_moderator_outlined),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                      ],
                                    )),
                                    ScrollableWidget(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Filiation et infos d'urgence",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nationalité",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _nationaliteController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre nationalité",
                                                      prefixIcon: const Icon(
                                                          Icons.flag),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Region d'origine",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _regionOrigineController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre region d'origine",
                                                      prefixIcon: const Icon(
                                                          Icons.location_on),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Departement d'origine",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _departementController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer votre département d'origine",
                                                      prefixIcon: const Icon(
                                                          Icons.location_on),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nom du prere",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _nomPereController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le nom de votre pere",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        // Container(
                                        //     margin: const EdgeInsets.only(
                                        //         left: 15, right: 15),
                                        //     width: 400,
                                        //     height: 100,
                                        //     decoration: const BoxDecoration(
                                        //         border: Border(
                                        //           top: BorderSide(
                                        //               color: Colors.blue),
                                        //           left: BorderSide(
                                        //               color: Colors.blue),
                                        //           right: BorderSide(
                                        //               color: Colors.blue),
                                        //           bottom: BorderSide(
                                        //               color: Colors.blue),
                                        //         ),
                                        //         borderRadius: BorderRadius.only(
                                        //             topLeft: Radius.circular(15),
                                        //             topRight: Radius.circular(15),
                                        //             bottomLeft: Radius.circular(15),
                                        //             bottomRight:
                                        //                 Radius.circular(15))),
                                        //     child: Column(children: [
                                        //       const SizedBox(height: 12),
                                        //       Row(
                                        //         children: [
                                        //           const SizedBox(
                                        //             width: 10,
                                        //           ),
                                        //           Text(
                                        //             "Sexe",
                                        //             style: TextStyle(
                                        //                 color: TEXT_COLOR,
                                        //                 fontSize: 20),
                                        //           )
                                        //         ],
                                        //       ),
                                        //       const SizedBox(height: 8),
                                        //       Row(
                                        //         children: [
                                        //           Radio(
                                        //               value: "Masculin",
                                        //               groupValue: _sexe,
                                        //               onChanged: (value) {
                                        //                 setState(() {
                                        //                   _sexe = value.toString();
                                        //                 });
                                        //               }),
                                        //           const Padding(
                                        //               padding:
                                        //                   EdgeInsets.only(left: 5),
                                        //               child: Text(
                                        //                 'Masculin',
                                        //                 style: TextStyle(
                                        //                     fontSize: 20,
                                        //                     color: Colors.black),
                                        //               )),
                                        //           const SizedBox(
                                        //             width: 20,
                                        //           ),

                                        //           Radio(
                                        //               value: "Feminin",
                                        //               groupValue: _sexe,
                                        //               onChanged: (value) {
                                        //                 setState(() {
                                        //                   _sexe = value.toString();
                                        //                 });
                                        //               }),
                                        //           const Padding(
                                        //               padding:
                                        //                   EdgeInsets.only(left: 5),
                                        //               child: Text(
                                        //                 'Feminin',
                                        //                 style: TextStyle(
                                        //                     fontSize: 20,
                                        //                     color: Colors.black),
                                        //               )),
                                        //           // DropdownButtonFormField<String>(
                                        //           //   value: selectedSexe,
                                        //           //   icon: const Icon(
                                        //           //     Icons.arrow_drop_down,
                                        //           //     size: 30,
                                        //           //   ),
                                        //           //   items: sexeList.map((String item) {
                                        //           //     return DropdownMenuItem(
                                        //           //         value: item, child: Text(item));
                                        //           //   }).toList(),
                                        //           //   onChanged: (String? value) {
                                        //           //     setState(() {
                                        //           //       selectedSexe = value!;
                                        //           //     });
                                        //           //   },
                                        //           // )
                                        //         ],
                                        //       )
                                        //     ])),
                                        // const SizedBox(
                                        //   height: 27,
                                        // ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Profession du pere",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _professionPereController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer la profession de votre pere",
                                                      prefixIcon: const Icon(
                                                          Icons.work),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nom de la mere",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _nomMereController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le nom de votre mere",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Profession de la mere",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _professionMereController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer la profession de votre mere",
                                                      prefixIcon: const Icon(
                                                          Icons.work),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),

                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nom du tuteur",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _nomTuteurController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  // validator: (value) {
                                                  //   if (value == null) {
                                                  //     return "Veuillez remplir ce champs";
                                                  //   }
                                                  // },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le nom de votre tuteur",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Profession du tuteur",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _professionTuteurController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer la profession de votre tuteur",
                                                      prefixIcon: const Icon(
                                                          Icons.work),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Nom de la personne a contacter",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _nomUrgenceController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le nomm de la personne a contacter",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text(
                                              "Numero de la personne a contacter",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _numUrgenceController,
                                                  maxLength: 15,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le numero de telephone de la personne a contacter",
                                                      prefixIcon: const Icon(
                                                          Icons.phone),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text(
                                              "Ville de la personne a contacter",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _villeUrgenceController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer la ville de la personne a contacter",
                                                      prefixIcon: const Icon(
                                                          Icons.location_on),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                      ],
                                    )),
                                    ScrollableWidget(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Autres informations",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(
                                          children: const [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Filiere",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 20),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("1er choix",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _firstChoiceController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                    // helperText:
                                                    //     "Nombre de caracteres autorisés",
                                                    labelText: "1er choix",
                                                    labelStyle: const TextStyle(
                                                        color: TEXT_COLOR,
                                                        fontSize: 20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    suffixIcon:
                                                        DropdownButtonFormField(
                                                            value:
                                                                selectedFirstChoice,

                                                            // ignore: missing_return
                                                            // validator: (String value2) {
                                                            //   value2=selectedMotif;
                                                            //   if(value2==''){
                                                            //     return 'motif invalide';
                                                            //   }
                                                            // },
                                                            items: _listFiliere
                                                                .map((String
                                                                    item) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            TEXT_COLOR,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              selectedFirstChoice =
                                                                  newValue;
                                                            },
                                                            hint: Text(
                                                              "Selectionner votre 1er choix",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            decoration: const InputDecoration(
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .book),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none))),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("2em choix",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _secondChoiceController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                    // helperText:
                                                    //     "Nombre de caracteres autorisés",
                                                    labelText: "2em choix",
                                                    labelStyle: const TextStyle(
                                                        color: TEXT_COLOR,
                                                        fontSize: 20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    suffixIcon:
                                                        DropdownButtonFormField(
                                                            value:
                                                                selectedSecondChoice,

                                                            // ignore: missing_return
                                                            // validator: (String value2) {
                                                            //   value2=selectedMotif;
                                                            //   if(value2==''){
                                                            //     return 'motif invalide';
                                                            //   }
                                                            // },
                                                            items: _listFiliere
                                                                .map((String
                                                                    item) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            TEXT_COLOR,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              selectedSecondChoice =
                                                                  newValue;
                                                            },
                                                            hint: Text(
                                                              "Selectionner votre 2em choix",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            decoration: const InputDecoration(
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .book),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none))),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("3em choix",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _thirdChoiceController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                    // helperText:
                                                    //     "Nombre de caracteres autorisés",
                                                    labelText: "3em choix",
                                                    labelStyle: const TextStyle(
                                                        color: TEXT_COLOR,
                                                        fontSize: 20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    suffixIcon:
                                                        DropdownButtonFormField(
                                                            value:
                                                                selectedThirdChoice,

                                                            // ignore: missing_return
                                                            // validator: (String value2) {
                                                            //   value2=selectedMotif;
                                                            //   if(value2==''){
                                                            //     return 'motif invalide';
                                                            //   }
                                                            // },
                                                            items: _listFiliere
                                                                .map((String
                                                                    item) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            TEXT_COLOR,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              selectedThirdChoice =
                                                                  newValue;
                                                            },
                                                            hint: Text(
                                                              "Selectionner votre 3em choix",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            decoration: const InputDecoration(
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .book),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none))),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Niveau",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _niveauController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                    // helperText:
                                                    //     "Nombre de caracteres autorisés",
                                                    labelText: "Niveau",
                                                    labelStyle: const TextStyle(
                                                        color: TEXT_COLOR,
                                                        fontSize: 20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    suffixIcon:
                                                        DropdownButtonFormField(
                                                            value:
                                                                selectedNiveau,

                                                            // ignore: missing_return
                                                            // validator: (String value2) {
                                                            //   value2=selectedMotif;
                                                            //   if(value2==''){
                                                            //     return 'motif invalide';
                                                            //   }
                                                            // },
                                                            items: _listNiveau
                                                                .map((String
                                                                    item) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            TEXT_COLOR,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              selectedNiveau =
                                                                  newValue;
                                                            },
                                                            hint: Text(
                                                              "Selectionner un niveau",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            decoration: const InputDecoration(
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .star),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none))),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Specialite",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _specialiteController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                    // helperText:
                                                    //     "Nombre de caracteres autorisés",
                                                    labelText: "Specialite",
                                                    labelStyle: const TextStyle(
                                                        color: TEXT_COLOR,
                                                        fontSize: 20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .blue.shade700,
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    suffixIcon:
                                                        DropdownButtonFormField(
                                                            value:
                                                                selectedSpecialite,

                                                            // ignore: missing_return
                                                            // validator: (String value2) {
                                                            //   value2=selectedMotif;
                                                            //   if(value2==''){
                                                            //     return 'motif invalide';
                                                            //   }
                                                            // },
                                                            items:
                                                                _listSpecialite
                                                                    .map((String
                                                                        item) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: item,
                                                                child: Text(
                                                                    item,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            TEXT_COLOR,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              selectedSpecialite =
                                                                  newValue;
                                                            },
                                                            hint: Text(
                                                              "Selectionner une Specialite",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                                fontSize: 17,
                                                              ),
                                                            ),
                                                            decoration: const InputDecoration(
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .book),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none))),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          children: const [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Diplome",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 20),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // Container(
                                        //     margin: const EdgeInsets.only(
                                        //         left: 15, right: 15),
                                        //     width: 400,
                                        //     height: 100,
                                        //     decoration: const BoxDecoration(
                                        //         border: Border(
                                        //           top: BorderSide(
                                        //               color: Colors.blue),
                                        //           left: BorderSide(
                                        //               color: Colors.blue),
                                        //           right: BorderSide(
                                        //               color: Colors.blue),
                                        //           bottom: BorderSide(
                                        //               color: Colors.blue),
                                        //         ),
                                        //         borderRadius: BorderRadius.only(
                                        //             topLeft: Radius.circular(15),
                                        //             topRight: Radius.circular(15),
                                        //             bottomLeft: Radius.circular(15),
                                        //             bottomRight:
                                        //                 Radius.circular(15))),
                                        //     child: Column(children: [
                                        //       const SizedBox(height: 12),
                                        //       Row(
                                        //         children: [
                                        //           const SizedBox(
                                        //             width: 10,
                                        //           ),
                                        //           Text(
                                        //             "Sexe",
                                        //             style: TextStyle(
                                        //                 color: TEXT_COLOR,
                                        //                 fontSize: 20),
                                        //           )
                                        //         ],
                                        //       ),
                                        //       const SizedBox(height: 8),
                                        //       Row(
                                        //         children: [
                                        //           Radio(
                                        //               value: "Masculin",
                                        //               groupValue: _sexe,
                                        //               onChanged: (value) {
                                        //                 setState(() {
                                        //                   _sexe = value.toString();
                                        //                 });
                                        //               }),
                                        //           const Padding(
                                        //               padding:
                                        //                   EdgeInsets.only(left: 5),
                                        //               child: Text(
                                        //                 'Masculin',
                                        //                 style: TextStyle(
                                        //                     fontSize: 20,
                                        //                     color: Colors.black),
                                        //               )),
                                        //           const SizedBox(
                                        //             width: 20,
                                        //           ),

                                        //           Radio(
                                        //               value: "Feminin",
                                        //               groupValue: _sexe,
                                        //               onChanged: (value) {
                                        //                 setState(() {
                                        //                   _sexe = value.toString();
                                        //                 });
                                        //               }),
                                        //           const Padding(
                                        //               padding:
                                        //                   EdgeInsets.only(left: 5),
                                        //               child: Text(
                                        //                 'Feminin',
                                        //                 style: TextStyle(
                                        //                     fontSize: 20,
                                        //                     color: Colors.black),
                                        //               )),
                                        //           // DropdownButtonFormField<String>(
                                        //           //   value: selectedSexe,
                                        //           //   icon: const Icon(
                                        //           //     Icons.arrow_drop_down,
                                        //           //     size: 30,
                                        //           //   ),
                                        //           //   items: sexeList.map((String item) {
                                        //           //     return DropdownMenuItem(
                                        //           //         value: item, child: Text(item));
                                        //           //   }).toList(),
                                        //           //   onChanged: (String? value) {
                                        //           //     setState(() {
                                        //           //       selectedSexe = value!;
                                        //           //     });
                                        //           //   },
                                        //           // )
                                        //         ],
                                        //       )
                                        //     ])),
                                        // const SizedBox(
                                        //   height: 27,
                                        // ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Type diplome",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _typediplomeController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le Type de diplome obtenu",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Annee d'obtention",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _anneObtentionController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer l'annee d'obtention du diplome",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Moyenne",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _moyenneController,
                                                  maxLength: 5,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer la moyenne obtenue",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Matricule du diplome",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _matriculeDiplomeController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le matricule du diplome",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Diplome delivre par",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _delivreurDiplomeController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le nom l'institut ayant delivre le diplome",
                                                      prefixIcon: const Icon(
                                                          Icons.person),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Date de delivrance",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _dateDelController,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1950),
                                                            //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime(2100));

                                                    if (pickedDate != null) {
                                                      // print(
                                                      //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                      String formattedDate =
                                                          //DateFormat('yyyy-MM-dd')
                                                          DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  pickedDate);
                                                      // print(
                                                      //     formattedDate); //formatted date output using intl package =>  2021-03-16
                                                      setState(() {
                                                        _dateDelController
                                                                .text =
                                                            formattedDate; //set output date to TextField value.
                                                      });
                                                    } else {}
                                                  },
                                                  readOnly: true,
                                                  keyboardType:
                                                      TextInputType.datetime,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      //labelText: "Date naissance",
                                                      hintText:
                                                          'Cliquer pour choisir une date de delivrance',
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      prefixIcon: const Icon(
                                                          Icons.event),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          children: const [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Infos Diverses",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 20),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Pratique du sport",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: 400,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 0.5),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: Column(children: [
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Radio(
                                                      value: true,
                                                      groupValue: _okSport,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _okSport = value!;
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Oui',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),

                                                  Radio(
                                                      value: false,
                                                      groupValue: _okSport,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _okSport = value!;
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Non',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  // DropdownButtonFormField<String>(
                                                  //   value: selectedSexe,
                                                  //   icon: const Icon(
                                                  //     Icons.arrow_drop_down,
                                                  //     size: 30,
                                                  //   ),
                                                  //   items: sexeList.map((String item) {
                                                  //     return DropdownMenuItem(
                                                  //         value: item, child: Text(item));
                                                  //   }).toList(),
                                                  //   onChanged: (String? value) {
                                                  //     setState(() {
                                                  //       selectedSexe = value!;
                                                  //     });
                                                  //   },
                                                  // )
                                                ],
                                              )
                                            ])),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Pratique de l'art",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            width: 400,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 0.5),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: Column(children: [
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Radio(
                                                      value: true,
                                                      groupValue: _okArt,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _okArt = value!;
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Oui',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),

                                                  Radio(
                                                      value: false,
                                                      groupValue: _okArt,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _okArt = value!;
                                                        });
                                                      }),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        'Non',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black),
                                                      )),
                                                  // DropdownButtonFormField<String>(
                                                  //   value: selectedSexe,
                                                  //   icon: const Icon(
                                                  //     Icons.arrow_drop_down,
                                                  //     size: 30,
                                                  //   ),
                                                  //   items: sexeList.map((String item) {
                                                  //     return DropdownMenuItem(
                                                  //         value: item, child: Text(item));
                                                  //   }).toList(),
                                                  //   onChanged: (String? value) {
                                                  //     setState(() {
                                                  //       selectedSexe = value!;
                                                  //     });
                                                  //   },
                                                  // )
                                                ],
                                              )
                                            ])),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                      ],
                                    )),
                                    ScrollableWidget(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Votre Code de preinscription",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 400,
                                            height: 75,
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15))),
                                            child: Column(children: [
                                              const SizedBox(height: 12),
                                              // Row(
                                              //   children: [
                                              //     const SizedBox(
                                              //       width: 10,
                                              //     ),
                                              //     Text(
                                              //       "Sexe",
                                              //       style: TextStyle(
                                              //           color: TEXT_COLOR,
                                              //           fontSize: 20),
                                              //     )
                                              //   ],
                                              // ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    "1528564252522",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 30),
                                                  ),
                                                  // DropdownButtonFormField<String>(
                                                  //   value: selectedSexe,
                                                  //   icon: const Icon(
                                                  //     Icons.arrow_drop_down,
                                                  //     size: 30,
                                                  //   ),
                                                  //   items: sexeList.map((String item) {
                                                  //     return DropdownMenuItem(
                                                  //         value: item, child: Text(item));
                                                  //   }).toList(),
                                                  //   onChanged: (String? value) {
                                                  //     setState(() {
                                                  //       selectedSexe = value!;
                                                  //     });
                                                  //   },
                                                  // )
                                                ],
                                              ),
                                            ])),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        ElevatedButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.green),
                                                fixedSize:
                                                    MaterialStatePropertyAll(
                                                  Size(100, 40),
                                                )),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Copier",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                      ],
                                    )),
                                    ScrollableWidget(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          "Infos Paiement et Documents",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 27,
                                        ),
                                        Row(
                                          children: const [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Infos de paiement",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 20),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Numero de transaction",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _noTransacController,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le numero de transaction",
                                                      prefixIcon: const Icon(
                                                          Icons.paid_rounded),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Photo recu preinscription",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: photoRecu != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            photoRecu!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: photoRecu != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              photoRecu =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                          "Importer une photo du recu",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          children: const [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Documents",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 20),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Numero CNI",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: const BoxDecoration(
                                                border: Border()),
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller:
                                                      _numCniCoontroller,
                                                  maxLength: 30,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor: Colors.black87,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return "Veuillez remplir ce champs";
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                      color: TEXT_COLOR),
                                                  decoration: InputDecoration(
                                                      helperText:
                                                          "Nombre de caracteres autorisés",

                                                      ///labelText: "Nationalite",
                                                      hintText:
                                                          "Entrer le numero de la CNI",
                                                      prefixIcon: const Icon(
                                                          Icons.paid_rounded),
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: TEXT_COLOR,
                                                              fontSize: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade700,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Photo CNI",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: photoCNI != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            photoCNI!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: photoCNI != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              photoCNI =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                          "Importer la photo de votre CNI",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Photo 4 x 4",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: photo4x4 != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            photo4x4!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: photo4x4 != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              photo4x4 =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                          "Importer une photo 4x4",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Releve du BAC",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: releveBac != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            releveBac!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: releveBac != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              releveBac =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                          "Importer votre releve du bac",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Releve du Probatoire",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: releveProbatoire != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            releveProbatoire!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: releveProbatoire != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              releveProbatoire =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                          "Importer votre releve du probatoire",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(children: const [
                                          SizedBox(width: 12),
                                          Text("Photocopie acte de naissance",
                                              style: TextStyle(
                                                  color: TEXT_COLOR,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            width: 412,
                                            height: 202,
                                            decoration: BoxDecoration(
                                                image: acteNaissance != null
                                                    ? DecorationImage(
                                                        image: FileImage(
                                                            acteNaissance!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : null,
                                                color: Colors.grey,
                                                border: const Border(
                                                  top: BorderSide(
                                                      color: Colors.blue),
                                                  left: BorderSide(
                                                      color: Colors.blue),
                                                  right: BorderSide(
                                                      color: Colors.blue),
                                                  bottom: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(
                                                                15))),
                                            child: acteNaissance != null
                                                ? const Text("")
                                                : const Icon(Icons.person,
                                                    color: Colors.white,
                                                    size: 200)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              acteNaissance =
                                                  await _getImageFromGallery();
                                              setState(() {});
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                width: 412,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: Colors.blue),
                                                    left: BorderSide(
                                                        color: Colors.blue),
                                                    right: BorderSide(
                                                        color: Colors.blue),
                                                    bottom: BorderSide(
                                                        color: Colors.blue),
                                                  ),
                                                  // borderRadius:
                                                  //     BorderRadius.only(
                                                  //         topLeft: Radius.circular(15),
                                                  //         topRight: Radius.circular(15),
                                                  //         bottomLeft: Radius
                                                  //             .circular(
                                                  //                 15),
                                                  //         bottomRight: Radius
                                                  //             .circular(
                                                  //                 15))
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                          "Importer votre acte de naissance",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ]))),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                      ],
                                    )),
                                  ])),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //const SizedBox(witdh: 20),
                              _currentPage == 0
                                  ? const Text("")
                                  : FloatingActionButton(
                                      onPressed: () {
                                        _pageController.animateToPage(
                                          _currentPage -
                                              1, // Index du mini-écran suivant
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves
                                              .easeInOut, // Courbe d'animation
                                        );
                                      },
                                      child: const Icon(Icons.arrow_back),
                                    ),

                              _currentPage == 4
                                  ? ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.green),
                                          fixedSize:
                                              const MaterialStatePropertyAll(
                                                  Size(120, 55))),
                                      onPressed: () async{
                                        if (_formKeyPreInscriptionUy1.currentState!
                                            .validate()) {
                                              saveEtudiant();
                                        
                                        // Navigator.push(
                                        //     context,
                                        //     PageRouteBuilder(
                                        //       pageBuilder: (_, __, ___) =>
                                        //           const AttenteValidation(),
                                        //     ));

                                        }
                                      },
                                      child: const Text('Envoyer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    )
                                  : FloatingActionButton(
                                      onPressed: () {
                                        _pageController.animateToPage(
                                          _currentPage +
                                              1, // Index du mini-écran suivant
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves
                                              .easeInOut, // Courbe d'animation
                                        );
                                      },
                                      child: const Icon(Icons.arrow_forward),
                                    )
                            ],
                          ),
                          const SizedBox(height: 70),
                          // ElevatedButton.icon(
                          //   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                          //                     Colors.red)),
                          //   onPressed: () {
                          //     // _getImage();
                          //   },
                          //   label: const Text(
                          //     "Annuler la procedure",
                          //     style: TextStyle(
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          //   icon: const Icon(
                          //     Icons.back_hand,
                          //     color: Colors.black,
                          //   ),
                          // ),
                          // TextButton(
                          //   onPressed:(){},

                          //  child:Text( "Annuler et Retourner a la page d'acccueil",style:TextStyle(fontSize:20,color:Colors.red))),
                        ],
                      ))

                  //fin
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ));
  }

  // Widget Navcircle(int index) {
  //   return Container(
  //     width: 10.0,
  //     height: 10.0,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: _currentPage == index
  //           ? const Color.fromARGB(255, 10, 210, 63)
  //           : const Color.fromARGB(255, 235, 9, 9),
  //     ),
  //   );
  // }
}
