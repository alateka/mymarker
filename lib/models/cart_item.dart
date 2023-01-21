class CartItem {
  String name = "";

  CartItem(this.name);

  setName(String name) {
    this.name = name;
  }

  Map toJson() => {'name': name};

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(json['name'] as String);
  }
}
