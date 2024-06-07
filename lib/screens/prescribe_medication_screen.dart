import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/consultation.dart';
import '../models/prescription.dart';
import '../services/data_service.dart';

class PrescribeMedicationScreen extends StatefulWidget {
  @override
  _PrescribeMedicationScreenState createState() => _PrescribeMedicationScreenState();
}

class _PrescribeMedicationScreenState extends State<PrescribeMedicationScreen> {
  final TextEditingController _medicationController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Consultation consultation = ModalRoute.of(context)!.settings.arguments as Consultation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Prescrever Medicamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _medicationController,
              decoration: InputDecoration(labelText: 'Medicação'),
            ),
            TextFormField(
              controller: _observationController,
              decoration: InputDecoration(labelText: 'Observações'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final prescription = Prescription(
                  consultation: consultation.date.toString(),
                  medication: _medicationController.text,
                  observation: _observationController.text,
                );
                context.read<DataService>().addPrescription(prescription);
                Navigator.pop(context);
              },
              child: Text('Prescrever'),
            ),
          ],
        ),
      ),
    );
  }
}
