import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'loading_indicator.dart';

class WebviewWidget extends StatefulWidget {
  final String url;
  final Key? webviewKey;

  const WebviewWidget({required this.url, this.webviewKey, super.key});

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (_) => setState(() => _isLoading = false),
          onWebResourceError: (error) {
            setState(() {
              _isLoading = false;
              _error = error.description;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    }
    return Stack(
      children: [
        WebViewWidget(controller: _controller, key: widget.webviewKey),
        if (_isLoading) const LoadingIndicator(),
      ],
    );
  }
}
