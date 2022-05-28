class LoginUser {
  String identifier;
  String password;

  LoginUser({this.identifier, this.password});

  LoginUser.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['password'] = password;
    return data;
  }
}
