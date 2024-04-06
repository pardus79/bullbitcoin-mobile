import 'package:bb_arch/address/view/addr_list_page.dart';
import 'package:bb_arch/address/view/addr_page.dart';
import 'package:bb_arch/home/home.dart';
import 'package:bb_arch/tx/view/tx_page.dart';
import 'package:bb_arch/wallet/view/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// ignore: slash_for_doc_comments
/**
 * Ideal routes:
 *  / - HomePage
 *  /wallet/{walletId} - WalletPage
 *  /wallet/{walletId}/tx/{txId} - TxPage
 *  /wallet/{walletId}/address-list - AddressListPage
 *  /wallet/{walletId}/address/{addrId} - AddressPage
 *  /wallet/{walletId}/settings - WalletSettingsPage
 *  /send - SendPage
 *  /receive - ReceivePage
 */
final GoRouter router = GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
      // TODO: Should be ideally '/wallet/{walletId}'
      path: '/wallet',
      builder: (context, state) {
        return const WalletPage();
      },
      routes: <RouteBase>[
        GoRoute(
            // TODO: Should be ideally '/wallet/{walletId}/tx/{txId}'
            path: 'tx',
            builder: (context, state) {
              return const TxPage();
            }),
        GoRoute(
            path: 'address-list',
            builder: (context, state) {
              return const AddressListPage();
            }),
        GoRoute(
            path: 'address',
            builder: (context, state) {
              return const AddressPage();
            }),
      ]),
]);
