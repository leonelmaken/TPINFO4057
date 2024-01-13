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
          
          toolbarHeight: 40,
          backgroundColor: Colors.blue,
          title: Text("Gerer vos parametres",style: TextStyle(color: Colors.white,fontSize: 15),),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
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
              indispo();
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
              indispo();
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
              indispo();
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
                deleteAccount();
              //  Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (_, __, ___) => TeacherGestion(),
              //           ));
            },
          ),
        ]))));
  }

  indispo() {
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
                  Icons.help,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "INFORMATION".toUpperCase(),
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            content: const Text(
              "Ce module n'est pas disponible pour le moment",
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

 deleteAccount() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            title: Row(
              children: [
                const Icon(
                  Icons.warning_amber_sharp,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Attention Suppresssion".toUpperCase(),
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            content: const Text(
              'Voulez vous vraiment supprimer votre compte?',
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                     _showSuccessSnackBarError("Vous ne pouvez pas supprimer votre compte pour le moment 😓");
                      Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const LoginPage(),
                    //   ),
                    // );
                  },
                  child: const Text('Oui')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Non'),
              ),
            ],
          );
        });
  }

   _showSuccessSnackBarError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 400,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        // action: SnackBarAction(
        //   label: 'Fermer',
        //   onPressed: () {},
        //   textColor: Colors.white,
        // ),
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 12),
        ),
        ],)
      ),
    );
  }
}
