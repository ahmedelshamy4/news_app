import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String blogUrl;
  const WebViewScreen({Key? key, required this.blogUrl}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View Screen'),
      ),
      body: WebView(
        initialUrl: widget.blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      ),
    );
  }
}
