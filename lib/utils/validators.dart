bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}

bool isValidCPF(String cpf) {
  // Remove qualquer caractere não numérico
  cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  if (cpf.length != 11 || RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
    return false;
  }

  List<int> digits = cpf.split('').map(int.parse).toList();

  // Verifica o primeiro dígito verificador
  int sum = 0;
  for (int i = 0; i < 9; i++) {
    sum += digits[i] * (10 - i);
  }
  int firstVerifier = sum % 11 < 2 ? 0 : 11 - (sum % 11);

  if (digits[9] != firstVerifier) {
    return false;
  }

  // Verifica o segundo dígito verificador
  sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += digits[i] * (11 - i);
  }
  int secondVerifier = sum % 11 < 2 ? 0 : 11 - (sum % 11);

  return digits[10] == secondVerifier;
}
