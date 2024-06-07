import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/prescription.dart';

class NurseMedicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prescriptions = context.watch<DataService>().getPrescriptions();

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicamentos'),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          final prescription = prescriptions[index];
          return ListTile(
            title: Text('Medicação: ${prescription.medication}'),
            subtitle: Text('Paciente: ${prescription.consultation}'),
          );
        },
      ),
    );
  }
}
