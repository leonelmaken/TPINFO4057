import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unieduc/Screen/Login.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  bool _obscuring = true;

  File? photoProfil = null;

  Future<File?> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    File imageFile = File(image.path);

    return imageFile;
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
        body: Center(
            child: Form(
          child: ScrollableWidget(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              // const Text(
              //   "Creer un Compte",
              //   style: TextStyle(
              //       color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                //image: DecorationImage(image: ),
                                image: photoProfil != null
                                    ? DecorationImage(
                                        image: FileImage(photoProfil!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                border: Border.all(color: Colors.grey),
                                shape: BoxShape.circle,
                                color: Colors.grey),
                            child: photoProfil != null
                                ? Text("")
                                : const Icon(
                                    Icons.person,
                                    size: 150,
                                    color: Colors.white,
                                  ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 100),
                              IconButton(
                                  onPressed: () async {
                                    photoProfil = await _getImageFromGallery();
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.photo_camera,
                                      size: 40, color: Colors.blue))
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  // FloatingActionButton(onPressed: (){},child: Icon(
                  //      Icons.photo_camera_sharp),)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  maxLength: 20,
                  controller: _nomController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champs";
                    }
                  },
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
                  decoration: const InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(
                        Icons.person_sharp,
                        size: 25,
                      ),
                      hintText: "Entrer votre nom",
                      hintStyle: TextStyle(letterSpacing: 1.2)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  maxLength: 20,
                  controller: _prenomController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champs";
                    }
                  },
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
                  decoration: const InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(
                        Icons.person_sharp,
                        size: 25,
                      ),
                      hintText: "Entrer votre Prenom",
                      hintStyle: TextStyle(letterSpacing: 1.2)),
                ),
              ),
              const SizedBox(
                height: 20,
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
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
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
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  controller: _phoneNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champs";
                    }
                  },
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
                  decoration: const InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(
                        Icons.phone,
                        size: 25,
                      ),
                      hintText: "Entrer votre Numero de telephone",
                      hintStyle: TextStyle(letterSpacing: 1.2)),
                ),
              ),
              const SizedBox(
                height: 20,
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
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
                  decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(
                        Icons.key,
                        size: 25,
                      ),
                      hintText: "Entrer un mot de passe",
                      hintStyle: TextStyle(letterSpacing: 1.2),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _obscuring = !_obscuring;

                            setState(() {});
                          },
                          icon: Icon(Icons.remove_red_eye))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  obscureText: _obscuring,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 100,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champs";
                    }
                  },
                  style: TextStyle(color: Colors.black, letterSpacing: 1.2),
                  decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(
                        Icons.key,
                        size: 25,
                      ),
                      hintText: "Confirmer le mot de passe",
                      hintStyle: TextStyle(letterSpacing: 1.2),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _obscuring = !_obscuring;

                            setState(() {});
                          },
                          icon: Icon(Icons.remove_red_eye))),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Creer un compte",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
              ),

              // ElevatedButton(
              //             style: ButtonStyle(
              //                 shape: MaterialStatePropertyAll(
              //                   RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(25),
              //                   ),
              //                 ),
              //                 backgroundColor:
              //                     const MaterialStatePropertyAll(Colors.blue),
              //                 fixedSize:
              //                     const MaterialStatePropertyAll(Size(220, 55))),
              //             onPressed: () {
              //               // Navigator.push(
              //               //     context,
              //               //     PageRouteBuilder(
              //               //       pageBuilder: (_, __, ___) =>
              //               //           FicheInscription(),
              //               //     ));
              //             },
              //             child: const Text('Creer un compte',
              //                 style: TextStyle(color: Colors.white, fontSize: 20)),
              //           ),
              const SizedBox(height: 20),
              const Divider(
                indent: 18,
                endIndent: 18,
              ),
              const SizedBox(height: 10),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Login(),
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
          ),
        ))));
  }
}
