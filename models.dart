class Item {
  String nome;

  Item({this.nome});

  Item.fromJson(Map<String, dynamic> json) {
    nome = json['name'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.nome;
    return data;
  }
}