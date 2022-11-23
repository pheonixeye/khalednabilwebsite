class Category {
  final String? id;
  final String titleAr;
  final String titleEn;
  final String thumbnail;

  Category({
    this.id,
    required this.titleAr,
    required this.titleEn,
    required this.thumbnail,
  });

  static Category fromJson(dynamic json) {
    return Category(
      id: json['_id'],
      titleAr: json['titlear'],
      titleEn: json['titleen'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titlear': titleAr,
      'titleen': titleEn,
      'thumbnail': thumbnail,
    };
  }

  static List<Category> categoryList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Category.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) =>
      other is Category &&
      other.runtimeType == runtimeType &&
      other.thumbnail == thumbnail &&
      other.titleAr == titleAr &&
      other.titleEn == titleEn &&
      other.id == id;

  @override
  int get hashCode => id.hashCode;
}
