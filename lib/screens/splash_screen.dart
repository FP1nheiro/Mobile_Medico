import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/logo.png'), // Adicione o logotipo aqui
          Text(
            'Médicos CZ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
      nextScreen: Consumer<AuthService>(
        builder: (context, auth, _) {
          return LoginScreen();
        },
      ),
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
    );
  }
}
