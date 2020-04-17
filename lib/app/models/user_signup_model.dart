import 'dart:convert';

class UserSignUpModel {
  String login;
  String password;

  UserSignUpModel({
    this.login,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
    };
  }

  static UserSignUpModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserSignUpModel(
      login: map['login'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserSignUpModel fromJson(String source) =>
      fromMap(json.decode(source));
}
