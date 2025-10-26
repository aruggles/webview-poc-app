import 'package:flutter_test/flutter_test.dart';
import 'package:webview_poc_app/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('StorageService', () {
    late StorageService service;

    setUp(() {
      service = StorageService();
      SharedPreferences.setMockInitialValues({});
    });

    test('loadUrls returns default URLs when none saved', () async {
      final urls = await service.loadUrls();
      expect(urls.length, 6);
      expect(urls[0], 'https://google.com');
    });

    test('saveUrls and loadUrls persist URLs', () async {
      final newUrls = List.generate(6, (i) => 'https://site$i.com');
      await service.saveUrls(newUrls);
      final loaded = await service.loadUrls();
      expect(loaded, newUrls);
    });
  });
}
