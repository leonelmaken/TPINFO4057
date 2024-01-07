import 'package:flutter/material.dart';
import 'package:unieduc/Screen/Accueil.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Screen/Inscription.dart';
import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Utils/theme.dart';

class AttenteValidation extends StatefulWidget {
  const AttenteValidation({super.key});

  @override
  State<AttenteValidation> createState() => _AttenteValidationState();
}

class _AttenteValidationState extends State<AttenteValidation> {
  final String salutation = DateTime.now().hour < 12 ? "Bonjour" : "Bonsoir";
  int etat = 2;

  @override
  void initState() {
    super.initState();
    setState(() {
      etat = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          etat == 1 ? Color.fromARGB(255, 239, 237, 237) : Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 20),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomePage(),
                    ));
              },
            );
          },
        ),
        elevation: 0.0,
      ),
      body: etat == 1
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/istockphoto-1138077363-612x612.jpg",
                  width: 500,
                ),
                Text(
                  "Attente de validation",
                  style: TextStyle(
                      color: TEXT_COLOR,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Votre preinscription a ete prise en compte, vous serez ",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "notifie lors de la sortie des resultats",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),

                //  ElevatedButton(onPressed:
                //  (){
                //   Navigator.push(
                //                 context,
                //                 PageRouteBuilder(
                //                   pageBuilder: (_, __, ___) => Accueil(),
                //                 ));
                //  }, child: Text("continuer"))
              ],
            ))
          : etat == 2
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/cool1.jpg",
                      width: 500,
                    ),
                    Text(
                      "Vous avez ete admis en Infos!",
                      style: TextStyle(
                          //✅
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Bravo, vous avez ete admis en filiere informatique niveau L1",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Veuillez cliquer sur le bouton ci dessous pour creer",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          " un compte",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //const Text(''),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.green),
                              fixedSize: const MaterialStatePropertyAll(
                                  Size(220, 55))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      CreateAccount(),
                                ));
                          },
                          child: const Text('Creer un compte',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        )
                      ],
                    )
                  ],
                ))
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/never2.jpg",
                      width: 300,
                    ),
                    Text(
                      "Vous n'avez pas ete selectionne en infos!😓",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Desole, vous n'avez pas ete selectionne en infos ",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "mais en Physique niveau L1",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "NB: Votre filiere n'est pas encore prise en charge",
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "par l'application",
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                        ),
                      ],
                    ),

                    //  ElevatedButton(onPressed:
                    //  (){
                    //   Navigator.push(
                    //                 context,
                    //                 PageRouteBuilder(
                    //                   pageBuilder: (_, __, ___) => Accueil(),
                    //                 ));
                    //  }, child: Text("continuer"))
                  ],
                )),
    );
  }
}
