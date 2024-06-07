import 'package:flutter/material.dart';

class MedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: Center(
        child: Text('Lista de Medicamentos'),
      ),
    );
  }
}
