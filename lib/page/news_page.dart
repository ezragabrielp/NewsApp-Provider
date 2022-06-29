import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final map;
  final String selectedUrl;

  const NewsPage({Key? key, required this.map, required this.selectedUrl})
      : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Page',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: Card(
        elevation: 10,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.selectedUrl,
          onWebViewCreated: (controller) {
            this.controller = controller;
            setState(() {
              controller.runJavascript(
                  "document.getElementsByTagName('header')[0].style.display='none'");
              controller.runJavascript(
                  "document.getElementsByTagName('header')[0].style.display='none'");
            });
          },
        ),
      ),
    );
  }
}
