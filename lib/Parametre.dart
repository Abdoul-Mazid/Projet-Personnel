import 'package:flutter/material.dart';

class Parametre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Mon Compte', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Profil
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage( 'image/9.png'), // Image de profil
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Utilisateur',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Text(
                        'email@exemple.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Liste des options
            Expanded(
              child: ListView(
                children: [
                  _buildOptionTile(
                    icon: Icons.shopping_bag,
                    title: 'Mes commandes',
                    context: context,
                    onTap: () {},
                  ),
                  _buildOptionTile(
                    icon: Icons.location_on,
                    title: 'Adresses enregistrées',
                    context: context,
                    onTap: () {},
                  ),
                  _buildOptionTile(
                    icon: Icons.payment,
                    title: 'Méthodes de paiement',
                    context: context,
                    onTap: () {},
                  ),
                  Divider(),
                  _buildOptionTile(
                    icon: Icons.logout,
                    title: 'Déconnexion',
                    context: context,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour chaque option
  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
          // Effet de survol en modifiant la couleur au survol
          tileColor: Colors.blue[50],
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
