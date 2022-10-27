// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: constant_identifier_names

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show IFrameElement;

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/functions/res_size.dart';
import 'package:khalednabilwebsite/styles/styles.dart';
import 'dart:ui' as ui;

class DivContact extends StatelessWidget {
  const DivContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionHeightHomepageViewAboutDiv(context),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        shape: Styles.ABOUTCARDBORDER,
        color: Colors.white.withOpacity(0.4),
        child: RowForColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          rc: isMobile(context) ? RowColumn.ROW : RowColumn.COLUMN,
          children: [
            const Expanded(
              flex: 1,
              child: MapViewIframe(),
            ),
            Expanded(
              flex: 1,
              child: RowForColumn(
                rc: isMobile(context) ? RowColumn.ROW : RowColumn.COLUMN,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowForColumn extends StatelessWidget {
  const RowForColumn({
    Key? key,
    required this.children,
    required this.mainAxisAlignment,
    required this.rc,
  }) : super(key: key);
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final RowColumn rc;
  @override
  Widget build(BuildContext context) {
    switch (rc) {
      case RowColumn.COLUMN:
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        );

      case RowColumn.ROW:
        return Column(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        );
    }
  }
}

class MapViewIframe extends StatefulWidget {
  const MapViewIframe({Key? key}) : super(key: key);

  @override
  State<MapViewIframe> createState() => _MapViewIframeState();
}

class _MapViewIframeState extends State<MapViewIframe> {
  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    _iframeElement.src =
        'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.6112790420652!2d31.340030000000002!3d30.076675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14583f8b31d13917%3A0xedb72dd88b50fad!2sDr.%20Khaled%20Nabil!5e0!3m2!1sen!2seg!4v1666873625337!5m2!1sen!2seg';
    _iframeElement.style.border = 'none';
    _iframeElement.style.height = '100%';
    _iframeElement.style.width = '100%';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}

///<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3452.6112790420652!2d31.340030000000002!3d30.076675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14583f8b31d13917%3A0xedb72dd88b50fad!2sDr.%20Khaled%20Nabil!5e0!3m2!1sen!2seg!4v1666873625337!5m2!1sen!2seg" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

enum RowColumn {
  ROW,
  COLUMN,
}
