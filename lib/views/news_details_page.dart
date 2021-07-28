import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_news_app/articles_model.dart';
import 'package:simple_news_app/views/news_card.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget newsDetails(ArticlesModel articlesModel, BuildContext context) {
  @override
  void initState() {
    initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  return Scaffold(
    appBar: AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_left_sharp,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'SimpleNewsApp',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: WebView(
        allowsInlineMediaPlayback: true,
        initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.require_user_action_for_all_media_types,
        initialUrl: articlesModel.url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    ),
  );
}
