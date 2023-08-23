class Cart {
  final String items;

  const Cart({
    required this.items,
  });

  Map<String, dynamic> toJson() => {
        "cart": []
      };
}