import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple d'une liste dynamique pour générer les cartes
    final List<Map<String, dynamic>> categories = [
      {'color': Colors.amber, 'text': 'Carte 1'},
      {'color': Colors.blue, 'text': 'Carte 2'},
      {'color': Colors.green, 'text': 'Carte 3'},
      {'color': Colors.orange, 'text': 'Carte 4'},
      {'color': Colors.red, 'text': 'Carte 5'},
      {'color': Colors.orange, 'text': 'Carte 6'},
      {'color': Colors.orange, 'text': 'Carte 7'},
      {'color': Colors.purple, 'text': 'Carte 8'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return SizedBox(
                  width:100 ,
                  height: 100,
                  child: Card(
                    color: category['color'],
                    child: Center(
                      child: Text(category['text']),
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
          children:  [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home)),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart)),
            IconButton(
              onPressed: () {},
              icon:Icon(Icons.account_circle)),
          ],
        ),
      ),
    );
  }
}
