import 'package:flutter/material.dart';
import 'package:unieduc/Screen/Inscription.dart';
import 'package:unieduc/Screen/Preinscription.dart';
import 'package:unieduc/Utils/theme.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final String salutation = DateTime.now().hour < 12 ? "Bonjour" : "Bonsoir";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      
        
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Page de bienvenue",style: TextStyle(
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