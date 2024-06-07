import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';

class ConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final consultations = context.watch<DataService>().getConsultations();

    return Scaffold(
      appBar: AppBar(title: Text('Minhas Consultas')),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            title: Text('Consulta com Dr(a). ${consultation.doctor}'),
            subtitle: Text('Data: ${consultation.date}, Hora: ${consultation.time}'),
          );
        },
      ),
    );
  }
}
