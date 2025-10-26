// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_poc_app/main.dart';

// Minimal mock for PlatformWebViewHitTestResult to fix undefined class error
class PlatformWebViewHitTestResult {}

void _logWebViewPlatformInstance() {
  print('WebViewPlatform.instance: ${WebViewPlatform.instance}');
}

class FakeWebViewPlatform extends WebViewPlatform {
  FakeWebViewPlatform();

  @override
  PlatformWebViewController createPlatformWebViewController(
    PlatformWebViewControllerCreationParams params,
  ) {
    // Return a minimal mock PlatformWebViewController for testing
    return _FakePlatformWebViewController(params);
  }
}

// Minimal mock implementation for PlatformWebViewController
class _FakePlatformWebViewController implements PlatformWebViewController {
  _FakePlatformWebViewController(
    PlatformWebViewControllerCreationParams params,
  );

  @override
  PlatformWebViewControllerCreationParams get params =>
      throw UnimplementedError();

  // Minimal stub overrides for compilation only
  @override
  Future<void> loadHtmlString(String html, {String? baseUrl}) async {}

  @override
  Future<void> loadFile(String absoluteFilePath) async {}

  @override
  Future<void> loadFlutterAsset(String key) async {}

  @override
  Future<String?> currentUrl() async => '';

  @override
  Future<void> reload() async {}

  @override
  Future<void> goBack() async {}

  @override
  Future<void> goForward() async {}

  @override
  Future<void> clearCache() async {}

  @override
  Future<void> addJavaScriptChannel(Object params) async {}

  @override
  Future<void> removeJavaScriptChannel(String name) async {}

  @override
  Future<void> setJavaScriptMode(Object mode) async {}

  @override
  Future<void> setBackgroundColor(Color color) async {}

  @override
  Future<void> setPlatformNavigationDelegate(Object delegate) async {}

  @override
  Future<void> setUserAgent(String? userAgent) async {}

  // Add stubs for all missing abstract members
  @override
  Future<bool> canGoBack() async => false;

  @override
  Future<bool> canGoForward() async => false;

  @override
  Future<void> clearLocalStorage() async {}

  @override
  Future<void> enableZoom(bool enabled) async {}

  @override
  Future<void> setOnPlatformPermissionRequest(
    void Function(PlatformWebViewPermissionRequest)? onPermissionRequest,
  ) async {}

  // Additional required stubs
  @override
  Future<Offset> getScrollPosition() async => Offset.zero;

  @override
  Future<String?> getTitle() async => '';

  @override
  Future<String?> getUserAgent() async => '';

  @override
  Future<void> loadFileWithParams(Object params) async {}

  // Additional required stubs
  @override
  Future<void> loadRequest(Object request) async {}

  @override
  Future<void> runJavaScript(String javaScript) async {}

  @override
  Future<Object> runJavaScriptReturningResult(String javaScript) async =>
      Object();

  @override
  Future<void> scrollBy(int dx, int dy) async {}

  @override
  Future<void> scrollTo(int x, int y) async {}

  @override
  Future<void> setHorizontalScrollBarEnabled(bool enabled) {
    // TODO: implement setHorizontalScrollBarEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setOnConsoleMessage(
    void Function(JavaScriptConsoleMessage consoleMessage) onConsoleMessage,
  ) {
    // TODO: implement setOnConsoleMessage
    throw UnimplementedError();
  }

  @override
  Future<void> setOnJavaScriptAlertDialog(
    Future<void> Function(JavaScriptAlertDialogRequest request)
    onJavaScriptAlertDialog,
  ) {
    // TODO: implement setOnJavaScriptAlertDialog
    throw UnimplementedError();
  }

  @override
  Future<void> setOnJavaScriptConfirmDialog(
    Future<bool> Function(JavaScriptConfirmDialogRequest request)
    onJavaScriptConfirmDialog,
  ) {
    // TODO: implement setOnJavaScriptConfirmDialog
    throw UnimplementedError();
  }

  @override
  Future<void> setOnJavaScriptTextInputDialog(
    Future<String> Function(JavaScriptTextInputDialogRequest request)
    onJavaScriptTextInputDialog,
  ) {
    // TODO: implement setOnJavaScriptTextInputDialog
    throw UnimplementedError();
  }

  @override
  Future<void> setOnScrollPositionChange(
    void Function(ScrollPositionChange scrollPositionChange)?
    onScrollPositionChange,
  ) {
    // TODO: implement setOnScrollPositionChange
    throw UnimplementedError();
  }

  @override
  Future<void> setOverScrollMode(WebViewOverScrollMode mode) {
    // TODO: implement setOverScrollMode
    throw UnimplementedError();
  }

  @override
  Future<void> setVerticalScrollBarEnabled(bool enabled) {
    // TODO: implement setVerticalScrollBarEnabled
    throw UnimplementedError();
  }

  @override
  bool supportsSetScrollBarsEnabled() {
    // TODO: implement supportsSetScrollBarsEnabled
    throw UnimplementedError();
  }
}

void main() {
  _logWebViewPlatformInstance();
  // Set a mock WebViewPlatform for testing
  WebViewPlatform.instance = FakeWebViewPlatform();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WebviewPocApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
