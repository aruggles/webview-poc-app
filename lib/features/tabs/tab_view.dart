import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/webview_widget.dart';
import '../settings/settings_view.dart';
import 'tab_bloc.dart';
import '../settings/settings_bloc.dart';
import '../../services/storage_service.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(create: (_) => TabBloc()),
        BlocProvider<SettingsBloc>(create: (_) => SettingsBloc()),
      ],
      child: const TabViewBody(),
    );
  }
}

class TabViewBody extends StatefulWidget {
  const TabViewBody({super.key});

  @override
  State<TabViewBody> createState() => _TabViewBodyState();
}

class _TabViewBodyState extends State<TabViewBody> {
  late StorageService _storageService;

  @override
  void initState() {
    super.initState();
    _storageService = StorageService();
    _loadUrls();
  }

  Future<void> _loadUrls() async {
    final urls = await _storageService.loadUrls();
    context.read<TabBloc>().add(UrlsUpdated(urls));
    context.read<SettingsBloc>().add(UpdateUrls(urls));
  }

  void _openSettings(List<String> urls) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsView(
          urls: urls,
          onSave: (newUrls) async {
            await _storageService.saveUrls(newUrls);
            context.read<TabBloc>().add(UrlsUpdated(newUrls));
            context.read<SettingsBloc>().add(UpdateUrls(newUrls));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, tabState) {
        return Scaffold(
          body: WebviewWidget(
            url: tabState.urls[tabState.selectedIndex],
            webviewKey: ValueKey(tabState.selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: List.generate(6, (index) {
              return BottomNavigationBarItem(
                icon: const Icon(Icons.web),
                label: Uri.parse(tabState.urls[index]).host,
              );
            }),
            currentIndex: tabState.selectedIndex,
            onTap: (index) {
              context.read<TabBloc>().add(TabChanged(index));
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.settings),
            onPressed: () {
              _openSettings(tabState.urls);
            },
            tooltip: 'Settings',
          ),
        );
      },
    );
  }
}
