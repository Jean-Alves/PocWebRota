class LoginRepository {
  Future<bool> validCpf(String cpf) async {
    await Future.delayed(Duration(seconds: 2));
    if (cpf == "233.602.490-03") //CPF gerado no 4DEVS
    {
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future<bool> validEmail(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "jean@webrota.com.br") {
      return Future.value(true);
    }

    return Future.value(false);
  }
}
