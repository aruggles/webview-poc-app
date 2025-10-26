import 'package:webview_flutter/webview_flutter.dart';

class StatePreservationService {
  final Map<int, WebViewController> _controllers = {};

  WebViewController? getController(int tabIndex) => _controllers[tabIndex];

  void setController(int tabIndex, WebViewController controller) {
    _controllers[tabIndex] = controller;
  }

  void removeController(int tabIndex) {
    _controllers.remove(tabIndex);
  }

  void clearAll() {
    _controllers.clear();
  }
}
