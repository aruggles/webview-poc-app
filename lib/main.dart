import 'package:flutter/material.dart';
import 'features/tabs/tab_view.dart';

void main() {
  runApp(const WebviewPocApp());
}

class WebviewPocApp extends StatelessWidget {
  const WebviewPocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview POC',
      theme: ThemeData(useMaterial3: true),
      home: const TabView(),
    );
  }
}
