import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Screen/TeacherGestion.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';
import 'StudentGestion.dart';
import 'UeGestion.dart';

class PersonnalGestion extends StatefulWidget {
  const PersonnalGestion({super.key});

  @override
  State<PersonnalGestion> createState() => _PersonnalGestionState();
}

class _PersonnalGestionState extends State<PersonnalGestion> {
  TextEditingController _matriculeController = new TextEditingController();

  TextEditingController _intituleController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  bool _obscuring = true;
  late String selectedNiveau;

  final formkey = GlobalKey<FormState>();

  addUe() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Formulaire d'ajout UE".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
            content: Column(
              children: [
                Row(children: const [
                  SizedBox(width: 12),
                  Text("code",
                      style: TextStyle(
                          color: TEXT_COLOR,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(border: Border()),
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
                          style: const TextStyle(color: TEXT_COLOR),
                          decoration: InputDecoration(

                              //labelText: "Matricule",
                              prefixIcon: const Icon(Icons.abc_outlined),
                              hintText: "Entrer votre matricule",
                              labelStyle: const TextStyle(
                                  color: TEXT_COLOR, fontSize: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 35,
                ),
                Row(children: const [
                  SizedBox(width: 12),
                  Text("code",
                      style: TextStyle(
                          color: TEXT_COLOR,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(border: Border()),
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
                          style: const TextStyle(color: TEXT_COLOR),
                          decoration: InputDecoration(

                              //labelText: "Matricule",
                              prefixIcon: const Icon(Icons.abc_outlined),
                              hintText: "Entrer votre matricule",
                              labelStyle: const TextStyle(
                                  color: TEXT_COLOR, fontSize: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("D'accord"),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _obscuring = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SECONDARY_COLOR,
        appBar: AppBar(
          //title: Text("Personnaliser votre gestion",style: TextStyle(fontSize: 15),),
          toolbarHeight: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          GestureDetector(
            child: Card(
              elevation: 1,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person_outlined),
                    title: Text("Gestion des etudiants"),
                    //subtitle: Text("Selectionner les etudiants admis"),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => StudentGestion(),
                        ));
            },
          ),
          SizedBox(
            height: 2,
          ),
          GestureDetector(
            child: Card(
              elevation: 1,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.school_outlined),
                    title: Text("Gestion des UE"),
                    //subtitle: Text("Creer vos une en fonction du niveau"),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => UeGestion(),
                        ));
            },
          ),
          SizedBox(
            height: 2,
          ),
          GestureDetector(
            child: Card(
              elevation: 1,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person_3_outlined),
                    title: Text("Gestion des enseignants"),
                    // subtitle: Text("Creer un enseignant"),
                  )
                ],
              ),
            ),
            onTap: () {
               Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => TeacherGestion(),
                        ));
            },
          ),
        ]))));
  }
}
