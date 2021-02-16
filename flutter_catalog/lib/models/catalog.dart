class CatalogModel {
  static List<Item> items;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({this.id, this.name, this.desc, this.color, this.image, this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return new Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      color: map['color'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'desc': this.desc,
      'color': this.color,
      'image': this.image,
      'price': this.price,
    } as Map<String, dynamic>;
  }
}
