import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsState {
  final List<String> urls;

  SettingsState({required this.urls});

  SettingsState copyWith({List<String>? urls}) {
    return SettingsState(urls: urls ?? this.urls);
  }
}

abstract class SettingsEvent {}

class UpdateUrls extends SettingsEvent {
  final List<String> urls;
  UpdateUrls(this.urls);
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
    : super(
        SettingsState(
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
    on<UpdateUrls>((event, emit) {
      emit(state.copyWith(urls: event.urls));
    });
  }
}
