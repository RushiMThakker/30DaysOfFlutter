class CatalogModel {
  static List<Item> items;
}

class Item {
  final int id;
  final String title;
  final String desc;
  final String thumbnail;
  final String creator;
  final String uploadTime;

  Item({this.id, this.title, this.desc, this.thumbnail, this.creator,
      this.uploadTime});

  factory Item.fromMap(Map<String, dynamic> map) {
    return new Item(
      id: map['id'] as int,
      title: map['title'] as String,
      desc: map['desc'] as String,
      thumbnail: map['thumbnail'] as String,
      creator: map['creator'] as String,
      uploadTime: map['upload_time'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'desc': this.desc,
      'thumbnail': this.thumbnail,
      'creator': this.creator,
      'upload_time': this.uploadTime,
    } as Map<String, dynamic>;
  }
}
