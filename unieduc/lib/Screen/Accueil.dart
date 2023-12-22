import 'package:flutter/material.dart';
import 'package:unieduc/Screen/Inscription.dart';
import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Utils/theme.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  final String salutation = DateTime.now().hour < 12 ? "Bonjour" : "Bonsoir";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        PRIMARY_COLOR,
                        Color.fromARGB(255, 38, 83, 129)
                      ]),
                  // color: Colors.blue,
                ),
                child: Center(
                    child: Column(children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person,
                      size: 75,
                      color: Color.fromARGB(255, 77, 76, 76),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("$salutation Giresse",
                      style: const TextStyle(color: Colors.white, fontSize: 20))
                ])),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil',
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Accueil(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text("S'inscrire a l'universite",
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Inscription(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Parametres",
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  // Action à effectuer lorsque l'élément est cliqué
                  // Par exemple, naviguer vers la page d'accueil
                },
              ),
              const Divider(height: 40),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text("Partager l'Application",
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  // Action à effectuer lorsque l'élément est cliqué
                  // Par exemple, naviguer vers la page d'accueil
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('A propos',
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  // Action à effectuer lorsque l'élément est cliqué
                  // Par exemple, naviguer vers la page d'accueil
                },
              ),
              const Divider(height: 40),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Deconnexion',
                    style: TextStyle(color: TEXT_COLOR, fontSize: 17)),
                onTap: () {
                  // Action à effectuer lorsque l'élément est cliqué
                  // Par exemple, naviguer vers la page d'accueil
                },
              ),
              // Ajoutez d'autres éléments de menu ici
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 50,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 40),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          //  IconButton(icon: Icon(Icons.menu,size:40), onPressed:(){}),
          // title: Text('UNIVERSITY APP')
          // actions: <Widget>[Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children:[Icon(Icons.menu)])]
        ),
        
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Page d'accueil",style: TextStyle(
        color: TEXT_COLOR,
       ),),
       ElevatedButton(onPressed: 
       (){
        Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Preinscription(),
                      ));
       }, child: Text("Preinscription"))
        ],
       )
      ),
    );
  }
}