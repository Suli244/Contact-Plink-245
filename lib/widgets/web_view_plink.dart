import 'package:contact_plink/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPlink extends StatefulWidget {
  final String url;
  final String title;

  const WebPlink({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebPlink> createState() => _WebPlinkState();
}

class _WebPlinkState extends State<WebPlink> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarContactPlink(title: widget.title),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
