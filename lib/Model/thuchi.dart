class ThuChi {
  String? id;
  String? thu;
  String? chi;

  ThuChi({this.id, this.thu, this.chi});

  factory ThuChi.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'thu': String thu,
      'chi': String chi
      } =>
          ThuChi(
            id: id,
            thu: thu,
            chi: chi,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thu'] = this.thu;
    data['chi'] = this.chi;
    return data;
  }
}