import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khalednabilwebsite/config/const.dart';
import 'package:khalednabilwebsite/models/article_model.dart';

class HxArticles {
  static Future addArticle(Article article) async {
    final Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/cpanelarticles',
    );
    var body = jsonEncode(article.toJson());

    var response = await http.post(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw response.body;
    }
  }

  static Future deleteArticle(Article article) async {
    final Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/cpanelarticles',
    );
    var body = jsonEncode(article.toJson());

    var response = await http.delete(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw response.body;
    }
  }

  static Future fetchArticles({
    required int page,
    required int docid,
  }) async {
    final Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/cpanelarticles/fetch',
    );
    var body = jsonEncode({
      'docid': docid,
      'page': page,
    });

    var response = await http.post(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw response.body;
    }
  }

  static Future addRemoveParagraphToArticle({
    required ArticleParagraph paragraph,
    required String timeofpub,
    required String addRemove,
  }) async {
    final Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/cpanelarticles',
    );

    var body = jsonEncode({
      'paragraph': paragraph.toJson(),
      'timeofpub': timeofpub,
      'type': addRemove,
    });

    var response = await http.put(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw response.body;
    }
  }
}
