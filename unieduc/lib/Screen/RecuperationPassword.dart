import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';

class RecuperationPassword extends StatefulWidget {
  const RecuperationPassword({super.key});

  @override
  State<RecuperationPassword> createState() => _RecuperationPasswordState();
}

class _RecuperationPasswordState extends State<RecuperationPassword> {
  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();
  bool _obscuring = true;

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
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },
          
          icon: const  Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),
          
          ),
          
          elevation: 0.0,
        ),
        body: Container(
          
          child:SingleChildScrollView(child: Column(
            children: [
        
              Center(
                  child: Form(
                    key:formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                    "assets/images/logo1.png",
                    width: 300,
                  ),
                  const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: const Text(
                      "Formulaire de recuperation de mot de passe",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    ),

                    
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 40,
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Veuillez remplir ce champs";
                          }
                        },
                        style:
                            const TextStyle(color: Colors.black, letterSpacing: 1.2),
                        decoration: const InputDecoration(
                            counterText: "",
                            prefixIcon: Icon(
                              Icons.mail_outline_sharp,
                              size: 25,
                            ),
                            hintText: "Entrer votre Adresse mail",
                            hintStyle: TextStyle(letterSpacing: 1,fontSize: 10)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        maxLength: 100,
                        obscureText: _obscuring,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Veuillez remplir ce champs";
                          }
                        },
                        style:
                            const TextStyle(color: Colors.black, letterSpacing: 1.2),
                        decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: const Icon(
                              Icons.key,
                              size: 25,
                            ),
                            hintText: "Entrer le dernier mot de passe dont vous vous rappelez",
                            hintStyle: const TextStyle(letterSpacing: 1,fontSize: 10),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _obscuring = !_obscuring;
        
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove_red_eye))),
                      ),
                    ),
                   
                    
                    
                     const SizedBox(height: 40),
        
                    GestureDetector(
                      onTap: () async{
                        //save();
                        //Service.addUe();

        
                        // if (formkey.currentState!.validate()) {
                        // loading_popup(context);
                        // await Future.delayed(Duration(seconds: 3));
                        //   Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) =>
                        //           HomePage(),
                        //     ));
                        // }

                        
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
                                        Icons.key_sharp,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Recuperation Mot de passe".toUpperCase(),
                                        style: const TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                  content: const Text(
                                    "Votre demande a ete prise en compte vous serez notifie par mail pour le changement du mot de passe",
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
                      child: Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Envoyer",
                                style: TextStyle(color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                  ],
                ))),
            ],
          ),
        )));
  }
}
