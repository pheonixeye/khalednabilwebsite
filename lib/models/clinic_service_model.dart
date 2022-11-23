class ClinicService {
  final String? id;
  final String categoryId;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;
  final List<FaQ> faqs;

  ClinicService({
    this.id,
    required this.categoryId,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.image,
    required this.faqs,
  });

  static ClinicService fromJson(dynamic json) {
    return ClinicService(
      id: json['_id'],
      categoryId: json['categoryid'],
      titleEn: json['titleen'],
      titleAr: json['titlear'],
      descriptionEn: json['descriptionen'],
      descriptionAr: json['descriptionar'],
      image: json['image'],
      faqs: FaQ.faqListFromJson(json['faqs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryid': categoryId,
      'titleen': titleEn,
      'titlear': titleAr,
      'descriptionen': descriptionEn,
      'descriptionar': descriptionAr,
      'image': image,
      'faqs': FaQ.faqListToJson(faqs),
    };
  }

  static List<ClinicService> serviceList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => ClinicService.fromJson(e)).toList();
  }
}

class FaQ {
  final String questionEn;
  final String questionAr;
  final String answerEn;
  final String answerAr;
  final String? mediaItemId;

  FaQ({
    required this.questionEn,
    required this.questionAr,
    required this.answerEn,
    required this.answerAr,
    this.mediaItemId,
  });

  static FaQ fromJson(dynamic json) {
    return FaQ(
      questionEn: json['questionen'],
      questionAr: json['questionar'],
      answerEn: json['answeren'],
      answerAr: json['answerar'],
      mediaItemId: json['mediaitemid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionen': questionEn,
      'questionar': questionAr,
      'answeren': answerEn,
      'answerar': answerAr,
      'mediaitemid': mediaItemId,
    };
  }

  static List<FaQ> faqListFromJson(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => FaQ.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> faqListToJson(List<FaQ>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }
}
