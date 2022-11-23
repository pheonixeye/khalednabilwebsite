import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/sr_about/about_view.dart';
import 'package:khalednabilwebsite/sr_articles/articles_view.dart';
import 'package:khalednabilwebsite/sr_before_after_view/before_after_view.dart';
import 'package:khalednabilwebsite/sr_book_appointement/book_app_view.dart';
import 'package:khalednabilwebsite/sr_contact/contact_view.dart';
import 'package:khalednabilwebsite/sr_home_view/home_view.dart';
import 'package:khalednabilwebsite/sr_media/media_view.dart';
import 'package:khalednabilwebsite/sr_services/services_view.dart';

class Pages {
  static const List<Widget> pages = [
//home
    HomeView(),
//book
    BookAppointementView(),
//services
    ServicesView(),
//before&after
    BeforeAfterView(),
//media
    MediaView(),
//articles
    ArticlesView(),
//contact
    ContactView(),
//about
    AboutView(),
  ];
}
