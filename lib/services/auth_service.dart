import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  AuthService() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('user_name');
    String? email = prefs.getString('user_email');
    int? userType = prefs.getInt('user_type');

    if (name != null && email != null && userType != null) {
      _user = User(name: name, email: email, type: UserType.values[userType]);
      notifyListeners();
    }
  }

  Future<void> login(String email, String password, UserType type) async {
    // Contas pré-definidas
    if (email == "1@1.com" && password == "1" && type == UserType.doctor) {
      _user = User(name: "Dr. João", email: email, type: type);
    } else if (email == "2@2.com" && password == "2" && type == UserType.nurse) {
      _user = User(name: "Enf. Maria", email: email, type: type);
    } else if (email == "3@3.com" && password == "3" && type == UserType.patient) {
      _user = User(name: "Test User", email: email, type: type);
    } else {
      throw Exception('Falha na autenticação');
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', _user!.name);
    prefs.setString('user_email', _user!.email);
    prefs.setInt('user_type', _user!.type.index);
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_name');
    prefs.remove('user_email');
    prefs.remove('user_type');
    notifyListeners();
  }
}
