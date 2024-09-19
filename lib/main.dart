import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test002/pages/page_home.dart';
import 'package:test002/pages/syusyu/page_syusyu001.dart';

main() {
  final root = Root();
  final scope = ProviderScope(child: root);
  runApp(scope);
}

class Root extends ConsumerWidget {
  Root({super.key});

  final router = GoRouter(initialLocation: '/home', routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Homescreen(),
    ),
    GoRoute(
      path: '/syusyu',
      builder: (context, state) => const SyuSyu001screen(),
    ),
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
