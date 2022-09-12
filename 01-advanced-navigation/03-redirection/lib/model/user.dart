import 'dart:convert';

/// todo 2: create a user class to manage a email and password
class User {
  String? email;
  String? password;

  User({
    this.email,
    this.password,
  });

  @override
  String toString() => 'User(email: $email, password: $password)';

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.email == email && other.password == password;
  }

  @override
  int get hashCode => Object.hash(email, password); 
}
