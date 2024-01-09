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

class Parametres extends StatefulWidget {
  const Parametres({super.key});

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  TextEditingController _matriculeController = new TextEditingController();

  TextEditingController _intituleController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  bool _obscuring = true;
  late String selectedNiveau;

  final formkey = GlobalKey<FormState>();

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
                    leading: Icon(Icons.color_lens),
                    title: Text("Theme"),
                    //subtitle: Text("Selectionner les etudiants admis"),
                  )
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (_, __, ___) => StudentGestion(),
              //           ));
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
                    leading: Icon(Icons.security_rounded),
                    title: Text("Confidentialité"),
                    //subtitle: Text("Selectionner les etudiants admis"),
                  )
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (_, __, ___) => StudentGestion(),
              //           ));
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
                    leading: Icon(Icons.help),
                    title: Text("Aide"),
                    //subtitle: Text("Creer vos une en fonction du niveau"),
                  )
                ],
              ),
            ),
            onTap: () {
              // Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (_, __, ___) => UeGestion(),
              //           ));
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
                    leading: Icon(Icons.delete_forever),
                    title: Text("Suppression de compte"),
                    // subtitle: Text("Creer un enseignant"),
                  )
                ],
              ),
            ),
            onTap: () {
              //  Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (_, __, ___) => TeacherGestion(),
              //           ));
            },
          ),
        ]))));
  }
}
