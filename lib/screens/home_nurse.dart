import 'package:caminho_de_casa/screens/nurse_consultations_screen.dart';
import 'package:caminho_de_casa/screens/nurse_medications_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNurse extends StatefulWidget {
  @override
  _HomeNurseState createState() => _HomeNurseState();
}

class _HomeNurseState extends State<HomeNurse> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeNursePage(),
    NurseConsultationsScreen(),
    NurseMedicationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Médicos CZ'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Consultas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medicamentos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}

class HomeNursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: <Widget>[
        _buildMenuItem(context, FontAwesomeIcons.stethoscope, 'Consultas', '/nurse_consultations'),
        _buildMenuItem(context, FontAwesomeIcons.pills, 'Medicamentos', '/nurse_medications'),
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
