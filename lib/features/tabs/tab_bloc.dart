import 'package:flutter_bloc/flutter_bloc.dart';

class TabState {
  final int selectedIndex;
  final List<String> urls;

  TabState({required this.selectedIndex, required this.urls});

  TabState copyWith({int? selectedIndex, List<String>? urls}) {
    return TabState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      urls: urls ?? this.urls,
    );
  }
}

abstract class TabEvent {}

class TabChanged extends TabEvent {
  final int index;
  TabChanged(this.index);
}

class UrlsUpdated extends TabEvent {
  final List<String> urls;
  UrlsUpdated(this.urls);
}

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc()
    : super(
        TabState(
          selectedIndex: 0,
          urls: [
            'https://google.com',
            'https://apple.com',
            'https://microsoft.com',
            'https://test.com',
            'https://adamruggles.com',
            'https://youtube.com',
          ],
        ),
      ) {
    on<TabChanged>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
    on<UrlsUpdated>((event, emit) {
      emit(state.copyWith(urls: event.urls));
    });
  }
}
