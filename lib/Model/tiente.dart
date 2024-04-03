class TienTe {
  String? id;
  String? name;
  String? symbol;
  String? img;

  TienTe({this.id, this.name, this.symbol, this.img});

  TienTe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['img'] = this.img;
    return data;
  }
}