import 'package:bb_arch/home/home.dart';
import 'package:bb_arch/wallet/view/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
      path: '/wallet/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return WalletPage(id: id!);
      }),
]);
