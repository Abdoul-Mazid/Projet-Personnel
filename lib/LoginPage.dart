import 'package:flutter/material.dart';
import 'package:flutter_application_1/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Appel à l'API pour l'authentification (ici, un délai simulé)
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Simuler une réponse d'authentification réussie ou échouée
      bool isAuthenticated = true;

      if (isAuthenticated) {
        // Rediriger l'utilisateur vers la page d'accueil
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _errorMessage = "Échec de la connexion. Vérifiez vos identifiants.";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'AUTHENTIFICATION',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Fond dégradé
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Contenu de la page
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Titre
                      Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50),
                      // Champ Email ou Numéro de téléphone
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          labelText: 'Email ou Téléphone',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email ou numéro de téléphone';
                          }
                          // Vérifier si c'est un email valide
                          if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return null;
                          }
                          // Vérifier si c'est un numéro de téléphone valide
                          if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
                            return 'Entrez un email valide ou un numéro de téléphone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Champ Mot de passe
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          if (value.length < 6) {
                            return 'Le mot de passe doit contenir au moins 6 caractères';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Affichage du message d'erreur
                      if (_errorMessage != null) ...[
                        Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        SizedBox(height: 16),
                      ],
                      // Bouton de connexion
                      _isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: _login,
                              child: Text(
                                'Se connecter',
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 5,
                              ),
                            ),
                      SizedBox(height: 20),
                      // Bouton pour s'inscrire
                      TextButton(
                        onPressed: () {
                          // Navigation vers la page d'inscription
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Pas de compte ? Inscrivez-vous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
