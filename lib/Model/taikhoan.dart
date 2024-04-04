class TaiKhoan {
  String? id;
  String? username;
  String? password;

  TaiKhoan({this.id, this.username, this.password});

  factory TaiKhoan.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'username': String username,
      'password': String password
      } =>
          TaiKhoan(
            id: id,
            username: username,
            password: password,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}