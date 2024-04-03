class ThuChi {
  String? id;
  String? thu;
  String? chi;

  ThuChi({this.id, this.thu, this.chi});

  ThuChi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thu = json['thu'];
    chi = json['chi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thu'] = this.thu;
    data['chi'] = this.chi;
    return data;
  }
}