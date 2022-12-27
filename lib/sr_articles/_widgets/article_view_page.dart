import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/animated_fab.dart';
import 'package:khalednabilwebsite/providers/px_article_view.dart';
import 'package:provider/provider.dart';

class ArticleViewPage extends StatelessWidget {
  const ArticleViewPage({
    Key? key,
    required this.articleid,
  }) : super(key: key);
  final String? articleid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: const MYFAB(),
      body: Opacity(
        opacity: 0.6,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bkgrnd2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<PxArticleView>(
            builder: (context, a, c) {
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
