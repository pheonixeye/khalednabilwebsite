class Article {
  final String? id;
  final int docid;
  final String timeOfPub;
  final String title;
  final String? shortDescription;
  final List<String> tags;
  final String? articleImage;
  final List<ArticleParagraph>? paragraphs;
  final List<ArticleComment>? comments;
  final bool? isEnglish;

  Article({
    this.id,
    required this.docid,
    required this.timeOfPub,
    required this.title,
    required this.shortDescription,
    required this.tags,
    required this.articleImage,
    required this.paragraphs,
    required this.comments,
    required this.isEnglish,
  });

  static Article fromJson(dynamic json) {
    return Article(
      id: json['_id'],
      docid: json['docid'],
      timeOfPub: json['timeofpub'],
      title: json['title'],
      shortDescription: json['shortdescription'],
      isEnglish: json['isenglish'],
      tags: listStringFromListDynamic(json['tags']),
      articleImage: json['articleimage'],
      paragraphs:
          ArticleParagraph.articleParagraphListFromJson(json['paragraphs']),
      comments: ArticleComment.articleCommentListFromJson(json['comments']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docid': docid,
      'timeofpub': timeOfPub,
      'title': title,
      'tags': tags,
      'shortdescription': shortDescription,
      'isenglish': isEnglish,
      'articleimage': articleImage,
      'paragraphs': ArticleParagraph.articleParagraphListToJson(paragraphs),
      'comments': ArticleComment.articleCommentListToJson(comments),
    };
  }

  static List<Article> articlesList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Article.fromJson(e)).toList();
  }

  static List<String> listStringFromListDynamic(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => e.toString()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class ArticleParagraph {
  final String title;
  final String body;
  final String? paragraphImage;
  final String? paragraphImageSubtitle;

  ArticleParagraph({
    required this.title,
    required this.body,
    required this.paragraphImage,
    required this.paragraphImageSubtitle,
  });

  static ArticleParagraph fromJson(dynamic json) {
    return ArticleParagraph(
      title: json['title'],
      body: json['body'],
      paragraphImage: json['paragraphimage'],
      paragraphImageSubtitle: json['paragraphimagesubtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'paragraphimage': paragraphImage,
      'paragraphimagesubtitle': paragraphImageSubtitle,
    };
  }

  static List<ArticleParagraph> articleParagraphListFromJson(
      List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => ArticleParagraph.fromJson(e)).toList();
  }

  static List articleParagraphListToJson(List<ArticleParagraph>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class ArticleComment {
  final String username;
  final String comment;
  final String timeOfPub;
  final List<ArticleCommentReply>? replies;

  ArticleComment({
    required this.username,
    required this.comment,
    required this.timeOfPub,
    required this.replies,
  });

  static ArticleComment fromJson(dynamic json) {
    return ArticleComment(
      username: json['username'],
      comment: json['comment'],
      timeOfPub: json['timeofpub'],
      replies: ArticleCommentReply.replyListFromJson(json['replies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'comment': comment,
      'timeofpub': timeOfPub,
      'replies': ArticleCommentReply.replyListToJson(replies),
    };
  }

  static List<ArticleComment> articleCommentListFromJson(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => ArticleComment.fromJson(e)).toList();
  }

  static List articleCommentListToJson(List<ArticleComment>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class ArticleCommentReply {
  final String username;
  final String reply;
  final String timeOfPub;

  ArticleCommentReply({
    required this.username,
    required this.reply,
    required this.timeOfPub,
  });

  static ArticleCommentReply fromJson(dynamic json) {
    return ArticleCommentReply(
      username: json['username'],
      reply: json['reply'],
      timeOfPub: json['timeofpub'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'reply': reply,
      'timeofpub': timeOfPub,
    };
  }

  static List<ArticleCommentReply>? replyListFromJson(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => ArticleCommentReply.fromJson(e)).toList();
  }

  static List? replyListToJson(List<ArticleCommentReply>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
