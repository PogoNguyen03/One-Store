// user_model_admin.dart

class User {
  final int id;
  final String name;
  final String username;
  final String phone;
  final String password;


  User({
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',

    );
  }
}
