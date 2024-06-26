import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Médicos CZ'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthService>().logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildMenuGrid(context),
              SizedBox(height: 20),
              _buildHealthTipsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medicamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Tratamentos',
          ),
        ],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: <Widget>[
        _buildMenuItem(context, FontAwesomeIcons.notesMedical, 'Prescrição Médica', '/prescription'),
        _buildMenuItem(context, FontAwesomeIcons.syringe, 'Controle de Vacinação', '/vaccination'),
        _buildMenuItem(context, FontAwesomeIcons.vial, 'Conexão Laboratório', '/laboratory'),
        _buildMenuItem(context, FontAwesomeIcons.heartbeat, 'Dicas de Saúde', '/healthtips'),
        _buildMenuItem(context, FontAwesomeIcons.userCheck, 'Usuário Autorizado', '/authorizeduser'),
        _buildMenuItem(context, FontAwesomeIcons.clipboardCheck, 'Avaliações', '/evaluations'),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Dicas de Saúde',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _buildHealthTip('Mantenha uma alimentação saudável e equilibrada'),
        _buildHealthTip('Pratique exercícios físicos regularmente'),
        _buildHealthTip('Consulte um médico regularmente'),
      ],
    );
  }

  Widget _buildHealthTip(String tip) {
    return Card(
      child: ListTile(
        title: Text(tip),
        trailing: TextButton(
          onPressed: () {},
          child: Text('Ver', style: TextStyle(color: Colors.blueAccent)),
        ),
      ),
    );
  }
}
