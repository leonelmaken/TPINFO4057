import 'package:flutter/material.dart';
import 'package:unieduc/Screen/CreateAccount.dart';
import 'package:unieduc/Screen/HomePage.dart';
import 'package:unieduc/Screen/addUe.dart';
import 'package:unieduc/Service.dart';
import 'package:unieduc/Utils/theme.dart';
import 'package:unieduc/Widget/Loading.dart';
import 'package:unieduc/Widget/ScrollableWidget.dart';

import '../Utils/Global.dart';
import 'RecuperationPassword.dart';
import 'package:data_table_2/data_table_2.dart';

class UeGestion extends StatefulWidget {
  const UeGestion({super.key});

  @override
  State<UeGestion> createState() => _UeGestionState();
}

class _UeGestionState extends State<UeGestion> {
  TextEditingController _matriculeController = new TextEditingController();

  TextEditingController _intituleController = new TextEditingController();
  TextEditingController _niveauController = new TextEditingController();
  TextEditingController _searchcontroler = new TextEditingController();

  bool _obscuring = true;
  late String selectedNiveau;
  var styleElement = TextStyle(
    fontWeight: FontWeight.w600,
  );

  final formkey = GlobalKey<FormState>();

  infoUe() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                color: Colors.indigoAccent,
                width: 5,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Informations'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: SizedBox(
        //height: 200,
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Niveau'),
                    Text(
                      'M1-GL',
                      style: styleElement,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Code:'),
                    Text(
                      'inf4017',
                      style: styleElement,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Intitule:'),
                    Text(
                      'Algo et complexite',
                      style: styleElement,
                    )
                  ],
                ),
              ),
             
              Divider(),
            ],
          ),
        ),
      ),
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
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                    top: 2,
                  ),
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 235, 235),
                  ),
                  child: TextField(
                    controller: _searchcontroler,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Tooltip(
                              message:
                                  'Cliquer ici pour ajouter une UE',
                              child: InkWell(
                                onTap: () async {
                                  Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  AddUe(),
                            ));
                                },
                                child: Container(
                                  color: Colors.blue,
                                  height: 40,
                                  width: 50,
                                  child: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Tooltip(
                              message:
                                  'Cliquer ici pour imprimer la liste des UE',
                              child: InkWell(
                                onTap: () async {}, //produit trouve
                                child: Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  color: Colors.orange,
                                  height: 40,
                                  width: 50,
                                  child: const Icon(
                                    Icons.print,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        hintText: 'Rechercher une UE',
                        hintStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 30, bottom: 15)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child:
              DataTable(
                columns: const [
                  DataColumn2(
                    label: Text(
                      'code',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    fixedWidth: 95,
                    size: ColumnSize.S,
                  ),
                  DataColumn2(
                    label: Text(
                      'intitule',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    fixedWidth: 95,
                    size: ColumnSize.M,
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
                      "INF4017",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    const DataCell(Text(
                      "Algo et complexite",
                      overflow: TextOverflow.fade,
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
                            onTap: () {
                              infoUe();
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                              size: 18,
                              color: Colors.blue,
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
                              Icons.delete,
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
                      "INF4077",
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )),
                    const DataCell(Text(
                      "UML et design patterns",
                      overflow: TextOverflow.fade,
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
                            onTap: () {
                              infoUe();
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                              size: 18,
                              color: Colors.blue,
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
                              Icons.delete,
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
                  "Attention Suppresssion".toUpperCase(),
                  style: const TextStyle(fontSize: 13),
                )
              ],
            ),
            content: const Text(
              'Voulez vous vraiment supprimer cet UE?',
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
