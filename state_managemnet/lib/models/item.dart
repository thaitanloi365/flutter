class Item {
  final String id;
  final String name;
  final double price;

  Item({this.id, this.name, this.price});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class ListItem {
  final List<Item> items;

  ListItem({
    this.items,
  });

  factory ListItem.fromJson(List<dynamic> json) {
    return ListItem(
      items: json.map((i) => Item.fromJson(i)).toList(),
    );
  }
}
