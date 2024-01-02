import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:unieduc/Screen/FicheInscription.dart';
import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/NavCircle.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'HomePage.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  TextEditingController dateNaissance = TextEditingController();
  int _currentPage = 0;

  final sexeList = ['MASCULIN', 'FEMININ', 'NON PRECISE'];
  String? selectedSexe;
  bool? _sexeMasculin = false;
  bool? _sexeFeminin = false;
  String? _sexe;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  final _currentPageNotifier = ValueNotifier<int>(0);
  late AnimationController _animationController;
  bool _isSidebarOpen = false;
  final String salutation = DateTime.now().hour < 12 ? "Bonjour" : "Bonsoir";

  late final List<String> _listNiveau = [
    'Licence 1',
    'Licence 2 ',
    'Licence 3',
    'Master 1',
    'Master 2'
  ];
  String? selectedNiveau;

  late final List<String> _listRegion = [
    'Extreme Nord',
    'Nord',
    'Adamaoua',
    'Centre',
    'Ouest',
    'Nord-Ouest',
    'Sud-Ouest',
    'Littoral',
    'Est',
    'Sud'
  ];

  late final List<String> _listSpecialite = [
    'Geni Logiciel',
    'Data Science',
    'SE et Reseau',
    'Securite Reseau',
  ];
  String? selectedSpecialite;

  late final List<String> _listAnnee = [
    '${DateTime.now().year + 2}/${DateTime.now().year + 3}',
    '${DateTime.now().year + 1}/${DateTime.now().year + 2}',
    '${DateTime.now().year}/${DateTime.now().year + 1}',
    '${DateTime.now().year - 1}/${DateTime.now().year}',
    '${DateTime.now().year - 2}/${DateTime.now().year - 1}',
  ];
  String? selectedAnnee;

  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _dateNaissConroller = new TextEditingController();
  TextEditingController _lieuNaissController = new TextEditingController();
  TextEditingController _regionOrigineController = new TextEditingController();
  TextEditingController _nationaliteController = new TextEditingController();
  TextEditingController _matriculeController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  TextEditingController _specialiteController = new TextEditingController();
  TextEditingController _anneeAcademiqueController =
      new TextEditingController();
  TextEditingController _noPremTranchController = new TextEditingController();
  TextEditingController _noDeuxTranchController = new TextEditingController();
  TextEditingController _noTotaliteController = new TextEditingController();
  TextEditingController _noTelController = new TextEditingController();

  final _formKeyInscriptionUy1 = GlobalKey<FormState>();
  final GlobalKey<SignatureState> _sigatureKey = GlobalKey();

  bool ue1 = false;
  bool ue2 = false;
  bool ue3 = false;
  bool ue4 = false;
  bool ue5 = false;
  bool ue6 = false;
  bool ue7 = false;
  bool ue8 = false;
  bool ue9 = false;
  bool ue10 = false;
  bool ue11 = false;
  bool ue12 = false;
  bool alls1 = false;
  bool alls2 = false;

  Future<File?> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    File imageFile = File(image.path);

    return imageFile;
  }

  File? recuTotalite = null;
  File? recuSecondTanche = null;
  File? recuFirstTranche = null;
  File? photo4x4 = null;

  @override
  void initState() {
    super.initState();
    recuTotalite = null;
    recuFirstTranche = null;
    recuSecondTanche = null;
    photo4x4 = null;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SECONDARY_COLOR,
        appBar: AppBar(
          toolbarHeight: 40,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          elevation: 0.0,
          title: Text(
            "INSCRIPTION UY1",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton(
                position: PopupMenuPosition.under,
                splashRadius: 10,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.more_vert, size: 20,
                      //color: Color(0xffCCCCCC),
                      color: Colors.white,
                    ),
                  ],
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: ListTile(
                        hoverColor: Colors.transparent,
                        minLeadingWidth: 5,
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Voir fiche d'inscription",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  title: Row(
                                    children: [
                                      const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Alerte".toUpperCase(),
                                        style: const TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                  content: const Text(
                                    "Vous n'avez pas de fiche d'inscription enregistée",
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("D'accord"),
                                    ),
                                  ],
                                );
                              });
                        },
                        leading: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        hoverColor: Colors.transparent,
                        minLeadingWidth: 5,
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text("Voir fiche de preinscripion",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            )),
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        leading: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    )
                  ];
                }),
          ],
          //  IconButton(icon: Icon(Icons.menu,size:40), onPressed:(){}),
          // title: Text('UNIVERSITY APP')
          // actions: <Widget>[Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children:[Icon(Icons.menu)])]
        ),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Container(
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
                ),
                      ],
                    )),
                Expanded(child: Row(
                  children: [
                    Container(),
                  ],
                )),
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
                child: Form(
              key: _formKeyInscriptionUy1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Navcircle(
                              index: 0,
                              currentPage:
                                  _currentPage), // Cercle pour le premier mini-écran
                          const SizedBox(width: 8.0),
                          Navcircle(index: 1, currentPage: _currentPage),
                          const SizedBox(width: 8.0),
                          Navcircle(index: 2, currentPage: _currentPage),
                          const SizedBox(width: 8.0),
                          Navcircle(index: 3, currentPage: _currentPage),

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
                              physics: _currentPage == 3
                                  ? const NeverScrollableScrollPhysics()
                                  : const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                ScrollableWidget(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "INFOS PERSONNELLES",
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
                                      Text("Matricule",
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
                                              controller: _matriculeController,
                                              maxLength: 10,
                                              keyboardType: TextInputType.text,
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
                                                  //labelText: "Matricule",
                                                  prefixIcon: const Icon(
                                                      Icons.abc_outlined),
                                                  hintText:
                                                      "Entrer votre matricule",
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
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ],
                                        )),
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
                                                    image: FileImage(photo4x4!),
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
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
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
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text("Importer une image",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ]))),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                  ],
                                )),
                                ScrollableWidget(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Paiement",
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
                                      Text("No Recu 1ere Tranche",
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
                                              controller:
                                                  _noPremTranchController,
                                              autofocus: true,
                                              maxLength: 30,
                                              inputFormatters: const [],
                                              keyboardType: TextInputType.text,
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
                                                      'Entrer le numero du recu de la 1ere tranche',
                                                  prefixIcon: const Icon(
                                                      Icons.payment_sharp),
                                                  //labelText: "Nom",
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
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("Photo Recu 1ere Tranche",
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
                                            image: recuFirstTranche != null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        recuFirstTranche!),
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
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: recuFirstTranche != null
                                            ? const Text("")
                                            : const Icon(Icons.description,
                                                color: Colors.white,
                                                size: 200)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          recuFirstTranche =
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
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                      "Importer recu 1ere tranche",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ]))),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("No Recu 2eme Tranche",
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
                                              controller:
                                                  _noDeuxTranchController,
                                              autofocus: true,
                                              maxLength: 30,
                                              inputFormatters: const [],
                                              keyboardType: TextInputType.text,
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
                                                      'Entrer le numero du recu de la 2eme tranche',
                                                  prefixIcon: const Icon(
                                                      Icons.payment_sharp),
                                                  //labelText: "Nom",
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
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("Photo recu 2eme tranche",
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
                                            image: recuSecondTanche != null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        recuSecondTanche!),
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
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: recuSecondTanche != null
                                            ? const Text("")
                                            : const Icon(Icons.description,
                                                color: Colors.white,
                                                size: 200)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          recuSecondTanche =
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
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                      "Importer recu 2eme tranche",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ]))),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("No Recu Totalite",
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
                                              controller: _noTotaliteController,
                                              autofocus: true,
                                              maxLength: 30,
                                              inputFormatters: const [],
                                              keyboardType: TextInputType.text,
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
                                                      'Entrer le numero du recu de la totalite',
                                                  prefixIcon: const Icon(
                                                      Icons.payments_sharp),
                                                  //labelText: "Nom",
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
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("Photo Recu totalite",
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
                                            image: recuTotalite != null
                                                ? DecorationImage(
                                                    image: FileImage(
                                                        recuTotalite!),
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
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: recuTotalite != null
                                            ? const Text("")
                                            : const Icon(Icons.description,
                                                color: Colors.white,
                                                size: 200)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          recuTotalite =
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
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text("Importer recu totalite",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ]))),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                  ],
                                )),
                                ScrollableWidget(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Selection d'UE",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 27,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "1er semestre",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Checkbox(
                                              value: alls1,
                                              onChanged: (value) {
                                                setState(() {
                                                  alls1 = value!;
                                                  ue1 = value;
                                                  ue2 = value;
                                                  ue3 = value;
                                                  ue4 = value;
                                                  ue5 = value;
                                                  ue6 = value;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              width: 17,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 20),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    Column(children: <Widget>[
                                      CheckboxListTile(
                                        title: const Text(
                                            'INF 3015: Algorithme et complexite',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue1,
                                        onChanged: (value) {
                                          setState(() {
                                            ue1 = value!;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                            'INF 3025: Calcul Scientifique',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue2,
                                        onChanged: (value) {
                                          setState(() {
                                            ue2 = value!;
                                          });
                                        },
                                      ),
                                      Column(children: <Widget>[
                                        CheckboxListTile(
                                          title: const Text('INF 3055: UML',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue3,
                                          onChanged: (value) {
                                            setState(() {
                                              ue3 = value!;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: const Text(
                                              'INF 3065: Gestion de projets',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue4,
                                          onChanged: (value) {
                                            setState(() {
                                              ue4 = value!;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: const Text(
                                              'INF 3075: Test de logiciel et assurence qualite',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue5,
                                          onChanged: (value) {
                                            setState(() {
                                              ue5 = value!;
                                            });
                                          },
                                        ),
                                      ]),
                                      CheckboxListTile(
                                        title: const Text(
                                            'ENG 3085: Learning english ',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue6,
                                        onChanged: (value) {
                                          setState(() {
                                            ue6 = value!;
                                          });
                                        },
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "2nd semestre",
                                              style: TextStyle(
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Checkbox(
                                              value: alls2,
                                              onChanged: (value) {
                                                setState(() {
                                                  alls2 = value!;
                                                  ue7 = value;
                                                  ue8 = value;
                                                  ue9 = value;
                                                  ue10 = value;
                                                  ue11 = value;
                                                  ue12 = value;
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              width: 17,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(height: 20),
                                    Column(children: <Widget>[
                                      CheckboxListTile(
                                        title: const Text(
                                            'INF 3015: Algorithme et complexite',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue7,
                                        onChanged: (value) {
                                          setState(() {
                                            ue7 = value!;
                                          });
                                        },
                                      ),
                                      CheckboxListTile(
                                        title: const Text(
                                            'INF 3025: Calcul Scientifique',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue8,
                                        onChanged: (value) {
                                          setState(() {
                                            ue8 = value!;
                                          });
                                        },
                                      ),
                                      Column(children: <Widget>[
                                        CheckboxListTile(
                                          title: const Text('INF 3055: UML',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue9,
                                          onChanged: (value) {
                                            setState(() {
                                              ue9 = value!;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: const Text(
                                              'INF 3065: Gestion de projets',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue10,
                                          onChanged: (value) {
                                            setState(() {
                                              ue10 = value!;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title: const Text(
                                              'INF 3075: Test de logiciel et assurence qualite',
                                              style:
                                                  TextStyle(color: TEXT_COLOR)),
                                          value: ue11,
                                          onChanged: (value) {
                                            setState(() {
                                              ue11 = value!;
                                            });
                                          },
                                        ),
                                      ]),
                                      CheckboxListTile(
                                        title: const Text(
                                            'ENG 3085: Learning english ',
                                            style:
                                                TextStyle(color: TEXT_COLOR)),
                                        value: ue12,
                                        onChanged: (value) {
                                          setState(() {
                                            ue12 = value!;
                                          });
                                        },
                                      ),
                                    ]),
                                  ],
                                )),
                                ScrollableWidget(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    Row(children: const [
                                      SizedBox(width: 12),
                                      Text("No Telephone",
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
                                              controller: _noTelController,
                                              autofocus: true,
                                              maxLength: 30,
                                              inputFormatters: const [],
                                              keyboardType:
                                                  TextInputType.number,
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
                                                      'Entrer votre numero de telephone',
                                                  prefixIcon:
                                                      const Icon(Icons.phone),
                                                  //labelText: "Nom",
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
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(width: 12),
                                              Text("Signature",
                                                  style: TextStyle(
                                                      color: TEXT_COLOR,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      _sigatureKey.currentState
                                                          ?.clear();
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete,
                                                        size: 20,
                                                        color: Colors.red)),
                                                const SizedBox(width: 12),
                                              ])
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        width: 400,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                            borderRadius: const BorderRadius
                                                    .only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: Signature(
                                          color: Colors.black,
                                          strokeWidth: 2.0,
                                          key: _sigatureKey,
                                        )),
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

                          _currentPage == 3
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
                                      fixedSize: const MaterialStatePropertyAll(
                                          Size(120, 55))),
                                  onPressed: () {
                                    if (_formKeyInscriptionUy1.currentState!
                                        .validate()) {
                                      print("Ok pour les champs");
                                    }
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              HomePage(),
                                        ));
                                  },
                                  child: const Text('Envoyer',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
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
                  )

                  //fin
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ))
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

class CustomIcons {
  static const IconData matricule =
      IconData(0xe900, fontFamily: 'MatriculeIcon');
}
