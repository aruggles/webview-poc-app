import 'package:flutter_test/flutter_test.dart';
import 'package:webview_poc_app/features/tabs/tab_bloc.dart';

void main() {
  group('TabBloc', () {
    late TabBloc bloc;

    setUp(() {
      bloc = TabBloc();
    });

    test('initial state has selectedIndex 0 and 6 URLs', () {
      expect(bloc.state.selectedIndex, 0);
      expect(bloc.state.urls.length, 6);
    });

    test('TabChanged updates selectedIndex', () async {
      bloc.add(TabChanged(2));
      await Future.delayed(Duration.zero);
      expect(bloc.state.selectedIndex, 2);
    });

    test('UrlsUpdated updates URLs', () async {
      final newUrls = List.generate(6, (i) => 'https://site$i.com');
      bloc.add(UrlsUpdated(newUrls));
      await Future.delayed(Duration.zero);
      expect(bloc.state.urls, newUrls);
    });
  });
}
