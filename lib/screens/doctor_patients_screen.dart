import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/data_service.dart';
import '../models/consultation.dart';

class DoctorPatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthService>().user;
    final consultations = context.watch<DataService>().getConsultationsForDoctor(currentUser!.name);
    final patients = consultations.map((consultation) => consultation.patient).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pacientes Atendidos'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return ListTile(
            title: Text(patient),
          );
        },
      ),
    );
  }
}
