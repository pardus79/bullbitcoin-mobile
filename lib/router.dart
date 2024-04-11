import 'package:bb_arch/address/view/addr_list_page.dart';
import 'package:bb_arch/address/view/addr_page.dart';
import 'package:bb_arch/home/home.dart';
import 'package:bb_arch/settings/view/settings_page.dart';
import 'package:bb_arch/tx/view/tx_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_create_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_import_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_recover_page.dart';
import 'package:bb_arch/wallet/view/wallet_page.dart';
import 'package:bb_arch/wallet-setup/view/wallet_setup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lwk_dart/lwk_dart.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// ignore: slash_for_doc_comments
/**
 * TODO:
 * Ideal routes:
 *  / - HomePage
 *  /wallet/{walletId} - WalletPage
 *  /wallet/{walletId}/tx/{txId} - TxPage
 *  /wallet/{walletId}/address-list - AddressListPage
 *  /wallet/{walletId}/address/{addrId} - AddressPage
 *  /wallet/{walletId}/settings - WalletSettingsPage
 *  /send - SendPage
 *  /receive - ReceivePage
 * This way, we can have navs from Tx to Address page and then to a different Tx.
 * And able to navigate back with h/w back button.
 * Since state will be updated based on route url paramters.
 * Will have good cache at repo layer, to avoid unnecessary network calls.
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
        GoRoute(
          path: WalletSetupPage.route.split('/').last,
          builder: (context, state) {
            return const WalletSetupPage();
          },
          routes: <RouteBase>[
            GoRoute(
                path: WalletCreatePage.route.split('/').last,
                builder: (context, state) {
                  return const WalletCreatePage();
                }),
            GoRoute(
                path: WalletImportPage.route.split('/').last,
                builder: (context, state) {
                  return const WalletImportPage();
                }),
            GoRoute(
                path: WalletRecoverPage.route.split('/').last,
                builder: (context, state) {
                  return const WalletRecoverPage();
                }),
          ],
        ),
      ]),
  GoRoute(
    path: SettingsPage.route,
    builder: (context, state) {
      return const SettingsPage();
    },
  ),
]);
