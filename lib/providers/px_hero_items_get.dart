// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/api/hx_hero_item.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/models/hero_item_model.dart';

class PxHeroItemsGet extends ChangeNotifier {
  List<HeroItemModel>? _heroItems = [];
  List<HeroItemModel>? get heroItems => _heroItems;

  Future fetchHeroItems(BuildContext context) async {
    var i =
        await HxHeroItem.fetchAllHeroItems(isMobile(context) ? true : false);
    _heroItems = HeroItemModel.heroList(i);
    notifyListeners();
  }

  int _page = 0;
  int get page => _page;

  void setPage() {
    _page == heroItems!.length ? _page = 0 : _page++;
  }
}
