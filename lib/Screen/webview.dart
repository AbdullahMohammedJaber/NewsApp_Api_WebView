import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class xx extends StatelessWidget {
  final String url;

  const xx(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
