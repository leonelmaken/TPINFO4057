import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';

class AddAnnonce extends StatefulWidget {
  const AddAnnonce({super.key});

  @override
  State<AddAnnonce> createState() => _AddAnnonceState();
}

class _AddAnnonceState extends State<AddAnnonce> {
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
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    minRadius: 15,
                    maxRadius: 15,
                    //backgroundImage: AssetImage('assets/images/profile.png'),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Ivana Georgette',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Form(
              //         key: formkey,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             // Image.asset(
              //             //   "assets/images/logo1.png",
              //             //   width: 300,
              //             // ),
              //             // const SizedBox(
              //             //   height: 30,
              //             // ),
              //             // const Text(
              //             //   "Login",
              //             //   style: TextStyle(
              //             //       color: Colors.blue,
              //             //       fontWeight: FontWeight.bold,
              //             //       fontSize: 25),
              //             // ),
              //             const SizedBox(
              //               height: 30,
              //             ),
              //             Container(
              //               height: 200,
              //               margin:
              //                   const EdgeInsets.only(left: 15, right: 15),
              //               child:Expanded(child: TextFormField(
              //                 keyboardType: TextInputType.emailAddress,
              //                 maxLength: 400,
              //                 controller: _emailController,
              //                 validator: (value) {
              //                   if (value!.isEmpty) {
              //                     return "Veuillez remplir ce champs";
              //                   }
              //                 },
              //                 style: const TextStyle(
              //                     color: Colors.black, letterSpacing: 1.2),
              //                 decoration: const InputDecoration(
              //                     counterText: "",
              //                     prefixIcon: Icon(
              //                       Icons.mail_outline_sharp,
              //                       size: 25,
              //                     ),
              //                     hintText: "A quoi pensez vous?",
              //                     hintStyle: TextStyle(letterSpacing: 1.2)),
              //               ),
              //             )),
              //             const SizedBox(
              //               height: 30,
              //             ),
        
              //             const SizedBox(height: 30),
        
              //             GestureDetector(
              //               onTap: () async {
              //                 //save();
              //                 //Service.addUe();
        
              //                 // if (formkey.currentState!.validate()) {
              //                 // loading_popup(context);
              //                 // await Future.delayed(Duration(seconds: 3));
        
              //                 // }
              //               },
              //               child: Container(
              //                 margin: const EdgeInsets.only(left: 10, right: 10),
              //                 height: 55,
              //                 decoration: const BoxDecoration(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(20)),
              //                     color: Colors.blue),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     const Text("Publier",
              //                         style: TextStyle(
              //                             color: Colors.white, fontSize: 20))
              //                   ],
              //                 ),
              //               ),
              //             ),
                         
              //           ],
              //         )),
              //   ],
              // ),
            ],
          ),
        ));
  }
}
