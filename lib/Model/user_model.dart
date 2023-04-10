class UserData {
  String? name, role, phone;
  int? age;

  UserData({required this.name, required this.age, required this.phone, required this.role});

  UserData.fromMap(Map<String, dynamic> map) {
    name = map[name];
    age = map[age];
    role = map[role];
    phone = map[phone];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'age': age,
        'role': role,
        'phone': phone,
      };
}
