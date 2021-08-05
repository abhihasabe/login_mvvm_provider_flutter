class LoginModel{

  String? userName;
  String? password;

  LoginModel();
  LoginModel.fromMap(Map<String, dynamic> data) {
    userName = data['userName'];
    password = data['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}