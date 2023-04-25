import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games/games/presentation/riverpod_games/games_riverpod.dart';
import 'core/themes.dart';
import 'games/presentation/widget/pages/games_change_bottom_nav_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final data = ProviderContainer();
  data.read(gameProvider.notifier).fetchGame();
  runApp(UncontrolledProviderScope(container: data, child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(gameChangeMode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.read(gameChangeMode.notifier).isDark
          ? ThemeMode.light
          : ThemeMode.dark,
      home: GamesChangeBottomNav(),
    );
  }
}
