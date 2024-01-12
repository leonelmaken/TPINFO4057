import 'package:flutter/material.dart';
import 'package:unieduc/Screen/UeGestion.dart';
import 'package:unieduc/Service.dart';

import '../Utils/theme.dart';

class AddUe extends StatefulWidget {
  @override
  _AddUeState createState() => _AddUeState();
}

class _AddUeState extends State<AddUe> {
  String selectedNiveau = "M1-GL";
  TextEditingController codeController = TextEditingController();
  TextEditingController intituleController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  List<String> niveaux = ["M1-GL", "M1-DS", "M1-SE", "M1-SR"];

  addUe(){
    String niveau = selectedNiveau;
    String nomUe = codeController.text;
    String intitule = intituleController.text;
    Service.addUe(niveau, nomUe, intitule).then((value){
        if(value=="success"){
            _showSuccessSnackBar("Ajout effectue avec succes 🙂");
        }else{
            _showSuccessSnackBarError("Ajout echoue 😓");
        }
    });
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        // action: SnackBarAction(
        //   label: 'Fermer',
        //   onPressed: () {},
        //   textColor: Colors.white,
        // ),
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.green,
        content:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ],)
      ),
    );
  }

  _showSuccessSnackBarError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        // action: SnackBarAction(
        //   label: 'Fermer',
        //   onPressed: () {},
        //   textColor: Colors.white,
        // ),
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ],)
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Form(
          key: formkey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "AJOUT UE",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  value: selectedNiveau,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNiveau = newValue!;
                    });
                  },
                  items: niveaux.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Sélectionner le niveau"),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: codeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez remplir ce champs";
                }
              },
              decoration: InputDecoration(
                labelText: "Code de l'UE",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Veuillez remplir ce champs";
                }
              },
              controller: intituleController,
              decoration: InputDecoration(
                labelText: "Intitulé de l'UE",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () async {

                if (formkey.currentState!.validate()) {
                  addUe();
                   Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => UeGestion(),
                    ));
                }
                
               
              },
              child: Container(
                margin: EdgeInsets.only(left: 2, right: 2),
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Ajouter",
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
