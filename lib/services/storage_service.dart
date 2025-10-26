import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _urlsKey = 'tab_urls';

  Future<List<String>> loadUrls() async {
    final prefs = await SharedPreferences.getInstance();
    final urls = prefs.getStringList(_urlsKey);
    if (urls == null || urls.length != 6) {
      return [
        'https://google.com',
        'https://apple.com',
        'https://microsoft.com',
        'https://test.com',
        'https://adamruggles.com',
        'https://youtube.com',
      ];
    }
    return urls;
  }

  Future<void> saveUrls(List<String> urls) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_urlsKey, urls);
  }
}
