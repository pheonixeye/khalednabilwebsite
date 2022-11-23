import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khalednabilwebsite/config/const.dart';
import 'package:khalednabilwebsite/models/hero_item_model.dart';

class HxHeroItem {
  static Future addHeroItemToServer({
    required HeroItemModel heroItemModel,
  }) async {
    Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/knheroitems',
    );
    var body = jsonEncode(heroItemModel.toJson());
    var response = await http.post(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );
    if (response.statusCode == 401) {
      throw Exception(response.body);
    } else {
      return response.body;
    }
  }

  static Future fetchAllHeroItems(bool isMobileOnly) async {
    Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/knheroitems/$isMobileOnly',
    );
    var response = await http.get(
      uri,
      headers: Environment().config.HEADERS,
    );
    if (response.statusCode == 401) {
      throw Exception(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  static Future deleteHeroItem(int order, bool isMobileOnly) async {
    Uri uri = Uri(
      scheme: Environment().config.SCHEME,
      host: Environment().config.HOST,
      port: Environment().config.PORT,
      path: '/knheroitems',
    );

    var body = jsonEncode({'order': order});

    var response = await http.delete(
      uri,
      body: body,
      headers: Environment().config.HEADERS,
    );
    if (response.statusCode == 401) {
      throw Exception(response.body);
    } else {
      return response.body;
    }
  }
}
