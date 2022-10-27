import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'package:khalednabilwebsite/exports/exports.dart';

const mFont = TextStyle(
  fontSize: 14,
);
const oFont = TextStyle(
  fontSize: 18,
);

TextStyle _tStyle(BuildContext context) {
  return isMobile(context) ? mFont : oFont;
}

class DivAbout extends StatelessWidget {
  const DivAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageViewAboutDiv(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.ABOUTCARDBORDER,
        color: Colors.white.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: isMobile(context) ? 1 : 3,
              child: ListView(
                controller: ScrollController(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.loc.about,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: isMobile(context) ? 22 : 38,
                        color: Colors.white,
                        decorationColor: Colors.amber,
                        decorationStyle: TextDecorationStyle.wavy,
                        shadows: const [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TODO: COPYWRITE
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Eum porro tenetur nam ducimus assumenda sed voluptas suscipit aut eaque distinctio ea deleniti eius est esse excepturi et vitae internos. Eos temporibus distinctio eum unde galisum veniam deleniti non odit error in quas sint!',
                      style: _tStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Et omnis laborum et optio magni aut cupiditate suscipit sed unde enim At dicta obcaecati. Non modi velit qui corrupti galisum non culpa quia? Ut odit perspiciatis est autem velit et soluta esse et consectetur quas est repellat alias.',
                      style: _tStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Et sequi consequuntur non voluptatem nihil nam temporibus accusantium et ullam quos hic voluptatum modi. Qui tenetur iusto non perspiciatis nostrum aut beatae maxime sed iure itaque At quidem voluptatibus aut praesentium quis et voluptatem dicta.',
                      style: _tStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Ut voluptate ipsum qui dicta repellendus qui iusto pariatur et obcaecati rerum ut internos natus. Aut pariatur ratione eos consequatur dolorem est ratione quisquam id quibusdam dolor qui unde rerum ea omnis ratione qui quos nulla. Id atque dolor sed minima repellendus qui esse sint est eligendi architecto ut consectetur impedit ea distinctio voluptates.',
                      style: _tStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: isMobile(context) ? 1 : 2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: const SizedBox(),
                    ),
                  ),
                  Image.asset(
                    'images/kn.png',
                    fit: isMobile(context) ? BoxFit.cover : BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
