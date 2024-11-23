import 'package:flutter/material.dart';

class Formulaire extends StatelessWidget {
  Formulaire({super.key});

  // Les contrôleurs pour capturer les données des champs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inscription Produit'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nom du produit:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Entrez le nom du produit',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Entrez la description du produit',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Prix (GNF):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Entrez le prix du produit',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Image du produit:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logique pour télécharger une image
                    print('Bouton de téléchargement d’image cliqué');
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text('Télécharger une image'),
                ),
                const SizedBox(height: 32),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logique pour enregistrer le produit
                      final String name = nameController.text;
                      final String description = descriptionController.text;
                      final String price = priceController.text;

                      if (name.isEmpty || description.isEmpty || price.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Erreur'),
                            content: const Text(
                                'Veuillez remplir tous les champs avant de soumettre.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        print('Produit enregistré :');
                        print('Nom : $name');
                        print('Description : $description');
                        print('Prix : $price');
                      }
                    },
                    child: const Text('Enregistrer le produit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

