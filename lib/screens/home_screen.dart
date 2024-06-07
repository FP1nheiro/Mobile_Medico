import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patients');
              },
              child: Text('Pacientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/doctors');
              },
              child: Text('Médicos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nurses');
              },
              child: Text('Enfermeiros'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/appointments');
              },
              child: Text('Marcar Consulta'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consultations');
              },
              child: Text('Minhas Consultas'),
            ),
          ],
        ),
      ),
    );
  }
}
