import 'package:flutter/material.dart';
import 'package:flutter_application_1/Acceuil.dart';
import 'package:flutter_application_1/InscriptionPage.dart';
import 'package:flutter_application_1/Parametre.dart';
import 'package:flutter_application_1/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Définir les routes ici
      routes: {
        '/home': (context) => Acceuil(),
        '/login': (context) => LoginPage(),
        '/register': (context) =>InscriptionPage(), // Ajouter cette ligne
      },
      home: Acceuil(),
    );
  }
}
