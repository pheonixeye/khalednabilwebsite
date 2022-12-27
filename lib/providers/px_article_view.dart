import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/models/article_model.dart';

class PxArticleView extends ChangeNotifier {
  Article? _article;
  Article? get article => _article;

  void selectArticle(Article? a) {
    _article = a;
    notifyListeners();
  }
}
