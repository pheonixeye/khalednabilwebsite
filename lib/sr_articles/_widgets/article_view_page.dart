import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/components/loading_animation_widget.dart';
import 'package:khalednabilwebsite/components/collective_footer.dart';
import 'package:khalednabilwebsite/providers/px_article_view.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:provider/provider.dart';

class ArticleViewPage extends StatefulWidget {
  const ArticleViewPage({
    Key? key,
    required this.articleid,
  }) : super(key: key);
  final String? articleid;

  @override
  State<ArticleViewPage> createState() => _ArticleViewPageState();
}

class _ArticleViewPageState extends State<ArticleViewPage> {
  @override
  void initState() {
    super.initState();
    _initArticle();
  }

  _initArticle() async {
    await context
        .read<PxArticleView>()
        .selectArticleFromServer(widget.articleid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // floatingActionButton: const MYFAB(),
      body: Opacity(
        opacity: 0.8,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bkgrnd2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<PxArticleView>(
              builder: (context, a, c) {
                while (a.article == null) {
                  return const LoadingAnimationWidget();
                }
                return ListView(
                  cacheExtent: 3000,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        a.article!.title,
                        style: Styles.ARTICLETITLESTEXTSYTYLE(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (a.article!.shortDescription != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          a.article!.shortDescription!,
                          style: Styles.ARTICLESUBTITLESTEXTSYTYLE(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (a.article!.articleImage != null)
                      Card(
                        elevation: 10,
                        shape: Styles.CARDSHAPE,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.memory(
                          base64Decode(a.article!.articleImage!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ...a.article!.paragraphs!.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.transparent,
                          shape: Styles.CARDSHAPE,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          child: ExpansionTile(
                            backgroundColor: Colors.white24,
                            collapsedBackgroundColor: Colors.white24,
                            initiallyExpanded: true,
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.title,
                                style: Styles.TITLESTEXTSYTYLE(context),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e.body,
                                style:
                                    Styles.ARTICLESUBTITLESTEXTSYTYLE(context),
                              ),
                            ),
                            children: [
                              if (e.paragraphImage != null)
                                Card(
                                  elevation: 10,
                                  shape: Styles.CARDSHAPE,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.memory(
                                    base64Decode(e.paragraphImage!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              if (e.paragraphImageSubtitle != null)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    e.paragraphImageSubtitle!,
                                    style: Styles.ARTICLESUBTITLESTEXTSYTYLE(
                                        context),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    ...COLLECTIVEFOOTER,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
