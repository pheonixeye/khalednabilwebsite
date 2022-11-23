// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' show IFrameElement;
import 'dart:ui' as ui;

class MapViewIframe extends StatefulWidget {
  const MapViewIframe({
    Key? key,
    required this.link,
  }) : super(key: key);
  final String link;
  @override
  State<MapViewIframe> createState() => _MapViewIframeState();
}

class _MapViewIframeState extends State<MapViewIframe> {
  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();
    //done CHECK LINK CHANGE WITH WIDGET CHANGE

    _iframeElement.src = widget.link;
    _iframeElement.style.border = 'none';
    _iframeElement.style.height = '100%';
    _iframeElement.style.width = '100%';
    _iframeElement.name = widget.link;

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement${widget.link}',
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
        child: IgnorePointer(
          child: HtmlElementView(
            key: UniqueKey(),
            viewType: 'iframeElement${widget.link}',
          ),
        ),
      ),
    );
  }
}
