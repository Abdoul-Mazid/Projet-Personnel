import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart'; // Assurez-vous que le chemin d'import est correct.
import 'package:flutter_application_1/Parametre.dart';
import 'package:marquee/marquee.dart';  // Assure-toi d'avoir bien ajouté ce package

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'color': Colors.white, 'text': 'Montre', 'image': 'assets/image/1.jpg'},
      {'color': Colors.white, 'text': 'Chaussure', 'image': 'assets/image/2.png'},
      {'color': Colors.white, 'text': 'Pantalon', 'image': 'assets/image/3.jpg'},
      {'color': Colors.white, 'text': 'Chemise', 'image': 'assets/image/4.jpg'},
      {'color': Colors.white, 'text': 'Voiture', 'image': 'assets/image/5.jpg'},
      {'color': Colors.white, 'text': 'Perruque', 'image': 'assets/image/6.jpg'}, 
      {'color': Colors.white, 'text': 'Ceinture', 'image': 'assets/image/7.jpg'},
      {'color': Colors.white, 'text': 'Ordinateur', 'image': 'assets/image/8.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Parametre()),
            );},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Catégories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Défilement horizontal des cartes
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                // Adaptation de la largeur des cartes en fonction de la taille de l'écran
                double cardWidth = _getCardWidth(context);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: cardWidth,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        // Action à effectuer lors du tap sur la carte
                        _onCategoryTap(context, category['text']);
                      },
                      child: Card(
                        color: category['color'],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Row(
                          children: [
                            // Texte défilant à gauche
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                child: Marquee(
                                  text: category['text'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  scrollAxis: Axis.horizontal, // Défilement horizontal
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  blankSpace: 20.0, // Espace entre chaque répétition
                                  velocity: 30.0, // Vitesse du défilement
                                  pauseAfterRound: Duration(seconds: 1), // Pause entre deux défilements
                                  startPadding: 10.0,
                                  accelerationDuration: Duration(seconds: 1),
                                  accelerationCurve: Curves.linear,
                                  decelerationDuration: Duration(milliseconds: 500),
                                  decelerationCurve: Curves.easeOut,
                                ),
                              ),
                            ),
                            // Image à droite
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                child: category['image'] != null
                                    ? Image.asset(
                                        category['image'],
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => const Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            // Navigation vers la page de connexion
            IconButton(
              onPressed: () {
                // Utilisation de la route nommée pour aller à la page de connexion
                Navigator.pushNamed(context, '/login'); // Assurez-vous que '/login' est bien défini dans routes
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour adapter la largeur des cartes en fonction de la taille de l'écran
  double _getCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return 100; // Pour les petits écrans (ex. smartphones en mode portrait)
    } else if (width < 900) {
      return 130; // Pour les écrans moyens (ex. tablettes)
    } else {
      return 170; // Pour les grands écrans (ex. tablettes en mode paysage, ordinateurs)
    }
  }

  // Fonction qui se déclenche lors du tap sur une carte
  void _onCategoryTap(BuildContext context, String category) {
    // Affiche une alerte, mais vous pouvez personnaliser l'action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Vous avez sélectionné la catégorie $category')),
    );
    // Vous pouvez rediriger vers une autre page ou effectuer une autre action
  }
}
