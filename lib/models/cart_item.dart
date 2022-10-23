class CartItem {
  String name = "";

  CartItem(this.name);

  setHour(String name) {
    this.name = name;
  }

  Map toJson() => {
    'description': name
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      json['name'] as String
    );
  }
}