import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/consultation.dart';
import '../models/doctor.dart';
import '../services/data_service.dart';
import '../services/auth_service.dart';

class ScheduleConsultationScreen extends StatefulWidget {
  @override
  _ScheduleConsultationScreenState createState() => _ScheduleConsultationScreenState();
}

class _ScheduleConsultationScreenState extends State<ScheduleConsultationScreen> {
  String? selectedDoctor;
  String? selectedTime;
  DateTime selectedDate = DateTime.now();
  final List<String> times = ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'];

  @override
  Widget build(BuildContext context) {
    final doctors = context.watch<DataService>().getDoctors();
    final currentUser = context.watch<AuthService>().user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Marcar Consulta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              hint: Text('Selecione o Médico'),
              value: selectedDoctor,
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value;
                });
              },
              items: doctors.map((Doctor doctor) {
                return DropdownMenuItem<String>(
                  value: doctor.name,
                  child: Text(doctor.name),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Selecione a Data'),
              subtitle: Text('${selectedDate.toLocal()}'.split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              hint: Text('Selecione o Horário'),
              value: selectedTime,
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
              items: times.map((String time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedDoctor != null && selectedTime != null) {
                  context.read<DataService>().addConsultation(
                    Consultation(
                      date: selectedDate,
                      time: selectedTime!,
                      doctor: selectedDoctor!,
                      patient: currentUser!.name, // Nome do paciente logado
                      scheduledAt: DateTime.now(),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Marcar Consulta'),
            ),
          ],
        ),
      ),
    );
  }
}
