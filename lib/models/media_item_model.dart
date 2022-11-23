class MediaItem {
  final String? id;
  final String title;
  final String description;
  final String src;
  final bool isLong;
  final String thumbnail;
  final String timeadded;

  MediaItem({
    this.id,
    required this.title,
    required this.description,
    required this.src,
    required this.isLong,
    required this.thumbnail,
    required this.timeadded,
  });

  static MediaItem fromJson(dynamic json) {
    return MediaItem(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      src: json['src'],
      isLong: json['islong'],
      thumbnail: json['thumbnail'],
      timeadded: json['timeadded'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'src': src,
      'islong': isLong,
      'thumbnail': thumbnail,
      'timeadded': timeadded,
    };
  }

  static List<MediaItem> mediaItemsList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => MediaItem.fromJson(e)).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
