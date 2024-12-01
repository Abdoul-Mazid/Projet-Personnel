import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int cartItemCount = 0;
  String selectedCategory = 'All';

  // Exemple de données par catégorie
  final Map<String, List<Map<String, String>>> productsByCategory = {
    'All': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Produit 1'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Produit 2'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Produit 3'},
    ],
    'Montre': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Montre A'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Montre B'},
    ],
    'Chaussure': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Chaussure X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Chaussure Y'},
    ],
    'Pantalon': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Pantalon X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Pantalon Y'},
    ],
    'Voiture': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Voiture X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Voiture Y'},
    ],
    'Perruque': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Perruque X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Perruque Y'},
    ],
    'Ceinture': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Ceinture X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Ceinture Y'},
    ],
    'Ordinateur': [
      {'image': 'https://via.placeholder.com/150', 'name': 'Ordinateur X'},
      {'image': 'https://via.placeholder.com/150', 'name': 'Ordinateur Y'},
    ],
  };

  void _addToCart() {
    setState(() {
      cartItemCount++;
    });
  }

  void _removeFromCart() {
    setState(() {
      if (cartItemCount > 0) cartItemCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = productsByCategory[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Shopping Page')),
        backgroundColor: Colors.blue,
        actions: [
          // Icône de panier avec compteur
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, size: 30),
                onPressed: () {
                  // Action pour afficher le panier
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Barre de sélection des catégories
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: productsByCategory.keys.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Text(category),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Grille des produits
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Nombre de colonnes
                crossAxisSpacing: 16, // Espacement entre les colonnes
                mainAxisSpacing: 16, // Espacement entre les lignes
                childAspectRatio: 0.8, // Ajuste le ratio largeur/hauteur
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          product['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              // Action pour modifier le produit
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Action pour supprimer le produit
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
