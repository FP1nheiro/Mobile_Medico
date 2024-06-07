import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescrições'),
      ),
      body: Center(
        child: Text('Lista de Prescrições'),
      ),
    );
  }
}
