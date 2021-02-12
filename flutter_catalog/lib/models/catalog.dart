class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th Generation",
        price: 999,
        color: "#33505a",
        image:
            "https://images-na.ssl-images-amazon.com/images/I/71MHTD3uL4L._SL1500_.jpg"),
    Item(
        id: 2,
        name: "Pixel 5",
        desc: "Google's latest pixel phone",
        price: 399,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT13qniUv5qMrQlsyYSusV61oVTzC3fA-fyVQ&usqp=CAU"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({this.id, this.name, this.desc, this.color, this.image, this.price});
}
