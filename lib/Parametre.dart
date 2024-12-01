import 'package:flutter/material.dart';

class Parametre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Compte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Section Profil
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), // Image de profil
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nom Utilisateur',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'email@exemple.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Liste des options
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Mes commandes'),
                    onTap: () {
                      // Navigation vers les commandes
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Adresses enregistrées'),
                    onTap: () {
                      // Navigation vers les adresses
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Méthodes de paiement'),
                    onTap: () {
                      // Navigation vers les paiements
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Déconnexion'),
                    onTap: () {
                      // Action pour déconnexion
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
