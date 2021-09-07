import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:girafee/Widgets/appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutCompanyHTMLViewer extends StatelessWidget {
  final String htmlText;

  const AboutCompanyHTMLViewer({
    Key? key,
    required this.htmlText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarwithCenterTitle(context, "About"),
      body: Center(
        child: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            var _controller = webViewController;
            _loadHTMLText(_controller);
          },
        ),
      ),
    );
  }

  _loadHTMLText(WebViewController controller) async {
    controller.loadUrl(
      Uri.dataFromString(
        this.htmlText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString(),
    );
  }
}
