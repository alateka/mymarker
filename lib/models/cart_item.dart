class CartItem {
  String description = "";
  String hour = "";

  CartItem(this.description, this.hour);

  setHour(String hour) {
    this.hour = hour;
  }
  setDescription(String description) {
    this.description = description;
  }

  Map toJson() => {
    'description': description,
    'hour': hour,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      json['description'] as String,
      json['hour'] as String
    );
  }
}