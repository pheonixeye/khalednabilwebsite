// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/api/hx_articles.dart';
import 'package:khalednabilwebsite/models/article_model.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:provider/provider.dart';

class PxArticlesGet extends ChangeNotifier {
  List<Article>? _articles = [];
  List<Article>? get articles => _articles;

  int _page = 0;
  int get page => _page;

  Future fetchArticles(BuildContext context) async {
    var a = await HxArticles.fetchArticles(
      page: page,
      isEnglish: context.read<PxLocale>().lang == 'en',
    );
    _articles = Article.articlesList(a);
    notifyListeners();
  }

  Future nextPage(BuildContext context) async {
    if (articles!.length < 5) {
      return;
    } else {
      _page++;
      notifyListeners();
      await fetchArticles(context);
    }
  }

  Future previousPage(BuildContext context) async {
    if (_page <= 0) {
      return;
    } else {
      _page--;
      notifyListeners();
      await fetchArticles(context);
    }
  }

  Future zeroPage(BuildContext context) async {
    _page = 0;
    notifyListeners();
    await fetchArticles(context);
  }
}
