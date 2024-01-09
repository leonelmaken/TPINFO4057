import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';
import 'package:data_table_2/data_table_2.dart';

class AdmissionStudent extends StatefulWidget {
  const AdmissionStudent({super.key});

  @override
  State<AdmissionStudent> createState() => _AdmissionStudentState();
}

class _AdmissionStudentState extends State<AdmissionStudent> {
  TextEditingController _matriculeController = new TextEditingController();

  TextEditingController _intituleController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  TextEditingController _searchcontroler = new TextEditingController();

  bool _obscuring = true;
  late String selectedNiveau;

  final formkey = GlobalKey<FormState>();

  addUe() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Formulaire d'ajout UE".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
            content: Column(
              children: [
                Row(children: const [
                  SizedBox(width: 12),
                  Text("code",
                      style: TextStyle(
                          color: TEXT_COLOR,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(border: Border()),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _matriculeController,
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black87,
                          validator: (value) {
                            if (value == null) {
                              return "Veuillez remplir ce champs";
                            }
                          },
                          style: const TextStyle(color: TEXT_COLOR),
                          decoration: InputDecoration(

                              //labelText: "Matricule",
                              prefixIcon: const Icon(Icons.abc_outlined),
                              hintText: "Entrer votre matricule",
                              labelStyle: const TextStyle(
                                  color: TEXT_COLOR, fontSize: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 35,
                ),
                Row(children: const [
                  SizedBox(width: 12),
                  Text("code",
                      style: TextStyle(
                          color: TEXT_COLOR,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(border: Border()),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _matriculeController,
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black87,
                          validator: (value) {
                            if (value == null) {
                              return "Veuillez remplir ce champs";
                            }
                          },
                          style: const TextStyle(color: TEXT_COLOR),
                          decoration: InputDecoration(

                              //labelText: "Matricule",
                              prefixIcon: const Icon(Icons.abc_outlined),
                              hintText: "Entrer votre matricule",
                              labelStyle: const TextStyle(
                                  color: TEXT_COLOR, fontSize: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 35,
                ),
              ],
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
        // floatingActionButton: FloatingActionButton(onPressed: (){}),
        appBar: AppBar(
          //title: Text("Personnaliser votre gestion",style: TextStyle(fontSize: 15),),
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
            child: SingleChildScrollView(
                child: Column(children: [
          Row(
            children: [
              Expanded(child:
              DataTable(
                columns: const [
                 
                  DataColumn2(
                    label: Text(
                      'Nom & Prenom',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                    fixedWidth: 95,
                    size: ColumnSize.M,
                  ),
                   DataColumn2(
                    label: Text(
                      'Niveau ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                    fixedWidth: 95,
                    size: ColumnSize.S,
                  ),
                  // DataColumn2(
                  //   label: Text(
                  //     'Niveau',
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  //   fixedWidth: 95,
                  //   size: ColumnSize.S,
                  // ),
                  DataColumn2(
                    label: Text('Action',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    fixedWidth: 95,
                    size: ColumnSize.S,
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    
                    const DataCell(Text(
                      "Jean Mbarga",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    const DataCell(Text(
                      "M1",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    // const DataCell(Text(
                    //   "L3",
                    //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    // )),
                    DataCell(Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.remove_red_eye,
                              size: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                           margin: const EdgeInsets.only(left: 7),
                          child: InkWell(
                            onTap: () {
                              _addFormDialog();
                            },
                            child: const Icon(
                              Icons.thumb_up_rounded,
                              size: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 7, right: 7),
                          child: InkWell(
                            onTap: () {
                              _deleteFormDialog();
                            },
                            child: const Icon(
                              Icons.thumb_down,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ]),
                  DataRow(cells: [
                    
                    const DataCell(Text(
                      "Pierre Jacob",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    const DataCell(Text(
                      "L3",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    // const DataCell(Text(
                    //   "L3",
                    //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    // )),
                    DataCell(Row(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.remove_red_eye,
                              size: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                           margin: const EdgeInsets.only(left: 7),
                          child: InkWell(
                            onTap: () {
                              _addFormDialog();
                            },
                            child: const Icon(
                              Icons.thumb_up_rounded,
                              size: 18,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 7, right: 7),
                          child: InkWell(
                            onTap: () {
                              _deleteFormDialog();
                            },
                            child: const Icon(
                              Icons.thumb_down,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ])
                ],
              )),
            ],
          )
        ]))));
  }

  _deleteFormDialog() {
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
                  "Attention Refus".toUpperCase(),
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            content: const Text(
              'Voulez vous vraiment Refuser cet etudiant en infos?',
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
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

   _addFormDialog() {
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
                  "Attention Ajout".toUpperCase(),
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            content: const Text(
              'Voulez vous vraiment Accepter cet etudiant en infos?',
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
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
}




