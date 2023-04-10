class LoginUser {
  String? email, pass;

  LoginUser({required this.email, required this.pass});

  LoginUser.fromMap(Map<String, dynamic> map) {
    email = map[email];
    pass = map[pass];
  }

  Map<String, dynamic> toMap() => {
        'email': email,
        'pass': pass,
      };
}
