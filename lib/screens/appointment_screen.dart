import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appointment.dart';
import '../services/data_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class AppointmentScreen extends StatelessWidget {
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController doctorController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marcar Consulta')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(controller: specialtyController, labelText: 'Especialidade'),
            CustomTextField(controller: doctorController, labelText: 'Médico'),
            CustomTextField(controller: dateController, labelText: 'Data'),
            CustomTextField(controller: timeController, labelText: 'Horário'),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                final appointment = Appointment(
                  doctor: doctorController.text,
                  date: DateTime.parse(dateController.text),
                  times: [timeController.text],
                  createdAt: DateTime.now(),
                );
                context.read<DataService>().addAppointment(appointment);
                Navigator.pop(context);
              },
              text: 'Marcar Consulta',
            ),
          ],
        ),
      ),
    );
  }
}
