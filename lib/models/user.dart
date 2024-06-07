enum UserType { patient, doctor, nurse }

class User {
  String name;
  String email;
  UserType type;

  User({required this.name, required this.email, required this.type});
}
