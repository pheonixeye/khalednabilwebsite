class HeroItemModel {
  final String image;
  final bool isMobileOnly;
  final HeroText title;
  final HeroText subtitle;
  final HeroText? description;
  final int order;

  HeroItemModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.isMobileOnly,
    required this.order,
  });

  static HeroItemModel fromJson(dynamic json) {
    return HeroItemModel(
      image: json['image'],
      isMobileOnly: json['ismobileonly'],
      title: HeroText.fromJson(json['title']),
      subtitle: HeroText.fromJson(json['subtitle']),
      description: HeroText.fromJson(json['description']),
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'ismobileonly': isMobileOnly,
      'title': title.toJson(),
      'subtitle': subtitle.toJson(),
      'description': description ?? toJson(),
      'order': order,
    };
  }

  static List<HeroItemModel> heroList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => HeroItemModel.fromJson(e)).toList();
  }
}

class HeroText {
  String textEn;
  String textAr;
  double fontSize;
  double xPos;
  double yPos;

  HeroText({
    this.textEn = '',
    this.textAr = '',
    this.fontSize = 16,
    this.xPos = 0,
    this.yPos = 0,
  });

  static HeroText fromJson(dynamic json) {
    return HeroText(
      textEn: json['texten'],
      textAr: json['textar'],
      fontSize: json['fontsize'],
      xPos: json['xpos'],
      yPos: json['ypos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'texten': textEn,
      'textar': textAr,
      'fontsize': fontSize,
      'xpos': xPos,
      'ypos': yPos,
    };
  }

  @override
  String toString() => toJson().toString();

  HeroText modTitleEn(String val) {
    return HeroText(
      textEn: val,
      textAr: textAr,
      fontSize: fontSize,
      xPos: xPos,
      yPos: yPos,
    );
  }

  HeroText modTitleAr(String val) {
    return HeroText(
      textEn: textEn,
      textAr: val,
      fontSize: fontSize,
      xPos: xPos,
      yPos: yPos,
    );
  }

  HeroText modFontSize(double val) {
    return HeroText(
      textEn: textEn,
      textAr: textAr,
      fontSize: val,
      xPos: xPos,
      yPos: yPos,
    );
  }

  HeroText modPosition(double x, double y) {
    return HeroText(
      textEn: textEn,
      textAr: textAr,
      fontSize: fontSize,
      xPos: x,
      yPos: y,
    );
  }
}
