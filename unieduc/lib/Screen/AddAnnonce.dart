import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController titreController = new TextEditingController();

  TextEditingController contentController = new TextEditingController();
  bool _obscuring = true;

  final formkey = GlobalKey<FormState>();
  bool visibleImage=false;

  File? imageAPublier = null;

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
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text("Creer une annonce",style: TextStyle(color: Colors.white,fontSize: 15),),
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
          margin: EdgeInsets.only(top: 20),
          child:SingleChildScrollView(child: Column(
            children: [
              Row(
                children: const [
                   SizedBox(width: 10),
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
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                   borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                ),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 400,
                    controller: titreController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez remplir ce champs";
                      }
                    },
                    style: const TextStyle(
                        color: Colors.black, letterSpacing: 1.2),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                        counterText: "",
                       
                        hintText: "Titre",
                        hintStyle: TextStyle(letterSpacing: 1.2)),
                  ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 240, 240),
                   borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                ),
                margin:
                    const EdgeInsets.only(left: 10, right: 10),
                child:TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLength: 400,
                  maxLines: null,
                  
                  controller: contentController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez remplir ce champs";
                    }
                  },
                  style: const TextStyle(
                      color: Colors.black, letterSpacing: 1.2),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                      counterText: "",
                     
                      hintText: "A quoi pensez vous?",
                      hintStyle: TextStyle(letterSpacing: 1.2)),
                )),
              const SizedBox(
                height: 30,
              ),
        
              const SizedBox(height: 10),

              Visibility(
                visible: visibleImage,
                child: Container(
                  width: 400,
                            height: 200,
                    decoration: BoxDecoration(
                                //image: DecorationImage(image: ),
                                image: imageAPublier != null
                                    ? DecorationImage(
                                        image: FileImage(imageAPublier!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                               
                                
                               ),
                )),
                 const SizedBox(height: 20),

              GestureDetector(
                onTap: () async {
                   imageAPublier = await _getImageFromGallery();
                                    setState(() {});
                  setState(() {
                    visibleImage=true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 55,
                  decoration: const BoxDecoration(
                    
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                      color: Colors.orange),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(!visibleImage?
                        "Ajouter une image":"Modifier l'image",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
              ),
               const SizedBox(height: 30),  
        
              GestureDetector(
                onTap: () async {
                  //save();
                  //Service.addUe();
        
                  // if (formkey.currentState!.validate()) {
                  // loading_popup(context);
                  // await Future.delayed(Duration(seconds: 3));
        
                  // }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 55,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Publier",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
              ),
            ],
          ),
    )));
  }
}
