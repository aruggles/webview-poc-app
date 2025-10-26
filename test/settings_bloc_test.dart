import 'package:flutter_test/flutter_test.dart';
import 'package:webview_poc_app/features/settings/settings_bloc.dart';

void main() {
  group('SettingsBloc', () {
    late SettingsBloc bloc;

    setUp(() {
      bloc = SettingsBloc();
    });

    test('initial state has 6 URLs', () {
      expect(bloc.state.urls.length, 6);
    });

    test('UpdateUrls updates URLs', () async {
      final newUrls = List.generate(6, (i) => 'https://site$i.com');
      bloc.add(UpdateUrls(newUrls));
      await Future.delayed(Duration.zero);
      expect(bloc.state.urls, newUrls);
    });
  });
}
