import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      height: 30,
                    ),
                    Image.asset(
                    "assets/images/logo1.png",
                    width: 300,
                  ),
                  const SizedBox(
                      height: 30,
                    ),
                    // const Text(
                    //   "Login",
                    //   style: TextStyle(
                    //       color: Colors.blue,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
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
                            hintStyle: TextStyle(letterSpacing: 1.2)),
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
                            hintText: "Entrer votre mot de passe",
                            hintStyle: const TextStyle(letterSpacing: 1.2),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _obscuring = !_obscuring;
        
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove_red_eye))),
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child:  TextButton(onPressed: (){
                            Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  RecuperationPassword(),
                            ));
                          }, child: const Text("Mot de passe oublié?",style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),)) ,
                        )
                       
                      ],
                    ),
                     const SizedBox(height: 30),
        
                    GestureDetector(
                      onTap: () async{
                        //save();
                        //Service.addUe();

        
                        // if (formkey.currentState!.validate()) {
                        // loading_popup(context);
                        // await Future.delayed(Duration(seconds: 3));
                        
                        // }
                        //Service.addMessage();
                       
                         
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Se connecter",
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
                          "Vous n'avez pas de compte?  ",
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
                                  CreateAccount(),
                            ));
                            },
                            child: const Text(
                              "Creer un Compte",
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
