import 'package:khalednabilwebsite/providers/exp_opacity_p.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:khalednabilwebsite/providers/nav_index_p.dart';
import 'package:khalednabilwebsite/providers/px_articles_get.dart';
import 'package:khalednabilwebsite/providers/px_booking_make.dart';
import 'package:khalednabilwebsite/providers/px_booking_s_c.dart';
import 'package:khalednabilwebsite/providers/px_clinics_get.dart';
import 'package:khalednabilwebsite/providers/px_hero_items_get.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => PxLocale()),
  ChangeNotifierProvider(create: (context) => PxNavIndex()),
  ChangeNotifierProvider(create: (context) => PxExpOpacity()),
  ChangeNotifierProvider(create: (context) => PxHeroItemsGet()),
  ChangeNotifierProvider(create: (context) => PxClinicGet()),
  ChangeNotifierProvider(create: (context) => PxBookingMake()),
  ChangeNotifierProvider(create: (context) => PxBookingSC()),
  ChangeNotifierProvider(create: (context) => PxArticlesGet()),
];
