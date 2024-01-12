import 'package:flutter/material.dart';


class AddUe extends StatefulWidget {
  @override
  _AddUeState createState() => _AddUeState();
}

class _AddUeState extends State<AddUe> {
  String selectedNiveau = "Niveau 1";
  TextEditingController codeController = TextEditingController();
  TextEditingController intituleController = TextEditingController();

  List<String> niveaux = ["Niveau 1", "Niveau 2", "Niveau 3", "Niveau 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une UE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: "Code de l'UE",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: intituleController,
              decoration: InputDecoration(
                labelText: "Intitulé de l'UE",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour traiter les données de l'UE
                String niveau = selectedNiveau;
                String code = codeController.text;
                String intitule = intituleController.text;

                // Affichez les données dans la console (remplacez cela par votre logique)
                print("Niveau: $niveau");
                print("Code: $code");
                print("Intitulé: $intitule");
              },
              child: Text("Ajouter l'UE"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
