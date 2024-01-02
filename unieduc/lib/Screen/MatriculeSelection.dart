import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Screen/Login.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';

class MatriculeSelction extends StatefulWidget {
  const MatriculeSelction({super.key});

  @override
  State<MatriculeSelction> createState() => _MatriculeSelctionState();
}

class _MatriculeSelctionState extends State<MatriculeSelction> {
  TextEditingController _matriculeController = new TextEditingController();

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
                      height: 30,
                    ),
                    Image.asset(
                    "assets/images/logo1.png",
                    width: 300,
                  ),
                  const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "CREATION DE COMPTE",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 40,
                        controller: _matriculeController,
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
                              Icons.abc,
                              size: 25,
                            ),
                            hintText: "Entrer votre Matricule",
                            hintStyle: TextStyle(letterSpacing: 1.2)),
                      ),
                    ),
                   
                    const SizedBox(
                      height: 1,
                    ),
                    
                    
                     const SizedBox(height: 60),
        
                    GestureDetector(
                      onTap: () async{
                        //save();
                        //Service.addUe();

        
                        if (formkey.currentState!.validate()) {
                        loading_popup(context);
                        await Future.delayed(Duration(seconds: 3));
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  CreateAccount(),
                            ));
                        }
        
                       
                         
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
                            Text("Suivant",
                                style: TextStyle(color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //       shape: MaterialStatePropertyAll(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(25),
                    //         ),
                    //       ),
                    //       backgroundColor:
                    //           const MaterialStatePropertyAll(Colors.blue),
                    //       fixedSize: const MaterialStatePropertyAll(Size(350, 55))),
                    //   onPressed: () {
                    //     // Navigator.push(
                    //     //     context,
                    //     //     PageRouteBuilder(
                    //     //       pageBuilder: (_, __, ___) =>
                    //     //           FicheInscription(),
                    //     //     ));
        
                    //     save();
                    //   },
                    //   child: const Text('Se Connecter',
                    //       style: TextStyle(
                    //           color: Colors.white, fontSize: 20, letterSpacing: 1.5)),
                    // ),
                    const SizedBox(height: 40),
                    const Divider(
                      indent: 18,
                      endIndent: 18,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Vous avez deja un compte?  ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 83, 81, 81),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () async{
                              loading_popup(context);
                        await Future.delayed(Duration(seconds: 1));
                              Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  Login(),
                            ));
                            },
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ],
                    )
                  ],
                ))),
            ],
          ),
        )));
  }
}
