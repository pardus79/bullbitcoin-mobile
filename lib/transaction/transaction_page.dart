import 'package:bb_mobile/_model/address.dart';
import 'package:bb_mobile/_model/transaction.dart';
import 'package:bb_mobile/_pkg/clipboard.dart';
import 'package:bb_mobile/_pkg/launcher.dart';
import 'package:bb_mobile/_pkg/mempool_api.dart';
import 'package:bb_mobile/_pkg/storage/hive.dart';
import 'package:bb_mobile/_pkg/wallet/address.dart';
import 'package:bb_mobile/_pkg/wallet/bdk/sensitive_create.dart';
import 'package:bb_mobile/_pkg/wallet/bdk/transaction.dart';
import 'package:bb_mobile/_pkg/wallet/repository/sensitive_storage.dart';
import 'package:bb_mobile/_pkg/wallet/repository/storage.dart';
import 'package:bb_mobile/_pkg/wallet/repository/wallets.dart';
import 'package:bb_mobile/_pkg/wallet/transaction.dart';
import 'package:bb_mobile/_pkg/wallet/update.dart';
import 'package:bb_mobile/_ui/app_bar.dart';
import 'package:bb_mobile/_ui/components/text.dart';
import 'package:bb_mobile/currency/bloc/currency_cubit.dart';
import 'package:bb_mobile/home/bloc/home_cubit.dart';
import 'package:bb_mobile/locator.dart';
import 'package:bb_mobile/network/bloc/network_cubit.dart';
import 'package:bb_mobile/network_fees/bloc/networkfees_cubit.dart';
import 'package:bb_mobile/styles.dart';
import 'package:bb_mobile/swap/bloc/watchtxs_bloc.dart';
import 'package:bb_mobile/transaction/bloc/state.dart';
import 'package:bb_mobile/transaction/bloc/transaction_cubit.dart';
import 'package:bb_mobile/transaction/rename_label.dart';
import 'package:boltz_dart/boltz_dart.dart' as boltz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class TxPage extends StatelessWidget {
  const TxPage({super.key, required this.tx});

  final Transaction tx;

  @override
  Widget build(BuildContext context) {
    // final home = context.read<HomeCubit>();
    // final wallet = home.state.selectedWalletCubit!;
    // final wallet = ;
    final walletBloc = context.read<HomeCubit>().state.getWalletBlocFromTx(tx);
    if (walletBloc == null) {
      context.pop();
      return const SizedBox.shrink();
    }
    final networkFees = NetworkFeesCubit(
      hiveStorage: locator<HiveStorage>(),
      mempoolAPI: locator<MempoolAPI>(),
      networkCubit: locator<NetworkCubit>(),
      defaultNetworkFeesCubit: context.read<NetworkFeesCubit>(),
    );

    final txCubit = TransactionCubit(
      tx: tx,
      walletBloc: walletBloc,
      walletUpdate: locator<WalletUpdate>(),

      walletTx: locator<WalletTx>(),
      bdkTx: locator<BDKTransactions>(),
      // walletSensTx: locator<WalletSensitiveTx>(),
      walletsStorageRepository: locator<WalletsStorageRepository>(),
      walletSensRepository: locator<WalletSensitiveStorageRepository>(),
      walletAddress: locator<WalletAddress>(),

      walletsRepository: locator<WalletsRepository>(),
      bdkSensitiveCreate: locator<BDKSensitiveCreate>(),

      // networkFeesCubit: networkFees,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: txCubit),
        BlocProvider.value(value: walletBloc),
        BlocProvider.value(value: networkFees),
        BlocProvider.value(value: locator<WatchTxsBloc>()),
      ],
      child: BlocListener<TransactionCubit, TransactionState>(
        listenWhen: (previous, current) => previous.tx != current.tx,
        listener: (context, state) async {
          // home.updateSelectedWallet(walletBloc);
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: const _TxAppBar(),
          ),
          body: const _Screen(),
        ),
      ),
    );
  }
}

class _TxAppBar extends StatelessWidget {
  const _TxAppBar();

  @override
  Widget build(BuildContext context) {
    final label =
        context.select((TransactionCubit cubit) => cubit.state.tx.label ?? '');

    return BBAppBar(
      text: label.isNotEmpty ? label : 'Transaction',
      onBack: () {
        context.pop();
      },
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TransactionCubit _) => _.state.tx);
    final swap = tx.swapTx;

    if (swap != null) return const _CombinedTxAndSwapPage();
    return const _OnlyTxPage();

    // final page = context.select((TransactionCubit _) => _.state.tx.pageLayout);
    // if()
    // return switch (page) {
    //   TxLayout.onlyTx => const _OnlyTxPage(),
    //   TxLayout.onlySwapTx => const _OnlySwapTxPage(),
    //   TxLayout.both => const _CombinedTxAndSwapPage(),
    // };
  }
}

class _OnlyTxPage extends StatelessWidget {
  const _OnlyTxPage();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: _TxDetails());
  }
}

class _OnlySwapTxPage extends StatelessWidget {
  const _OnlySwapTxPage();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: _SwapDetails());
  }
}

class _CombinedTxAndSwapPage extends StatelessWidget {
  const _CombinedTxAndSwapPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _TxDetails(),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            color: context.colour.surface.withOpacity(0.1),
            child: const Column(
              children: [
                Gap(8),
                BBText.title('Swap Details'),
                _SwapDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TxDetails extends StatelessWidget {
  const _TxDetails();

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TransactionCubit _) => _.state.tx);
    final isLiq = tx.isLiquid;
    final isSwapPending = tx.swapIdisTxid();

    // final toAddresses = tx.outAddresses ?? [];

    final err = context
        .select((TransactionCubit cubit) => cubit.state.errLoadingAddresses);

    final txid = tx.txid;
    final amt = tx.getAmount().abs();
    final isReceived = tx.isReceived();
    final fees = tx.fee ?? 0;
    final amtStr = context.select(
      (CurrencyCubit cubit) =>
          cubit.state.getAmountInUnits(amt, removeText: true),
    );
    final feeStr = context.select(
      (CurrencyCubit cubit) =>
          cubit.state.getAmountInUnits(fees, removeText: true),
    );
    final units = context.select(
      (CurrencyCubit cubit) => cubit.state.getUnitString(isLiquid: isLiq),
    );

    final statuss = tx.height == null || tx.height == 0 || tx.timestamp == 0;
    final status = statuss ? 'Pending' : 'Confirmed';
    final time = statuss
        ? 'Waiting for confirmations'
        : timeago.format(tx.getDateTime());
    final broadcastTime = tx.getBroadcastDateTime();

    final recipients = tx.outAddrs;
    final recipientAddress = isReceived
        ? tx.outAddrs.firstWhere(
            (element) => element.kind == AddressKind.deposit,
            orElse: () => Address(
              address: '',
              kind: AddressKind.deposit,
              state: AddressStatus.used,
            ),
          )
        : tx.outAddrs.firstWhere(
            (element) => element.kind == AddressKind.external,
            orElse: () => Address(
              address: '',
              kind: AddressKind.external,
              state: AddressStatus.used,
            ),
          );

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Gap(24),
            // const BumpFeesButton(),
            BBText.title(
              isReceived ? 'Amount received' : 'Amount sent',
            ),
            const Gap(4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  transformAlignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(isReceived ? 1 : -1),
                  child: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 12,
                  ),
                ),
                const Gap(8),
                BBText.titleLarge(
                  amtStr,
                  isBold: true,
                ),
                const Gap(4),
                BBText.title(
                  units,
                  isBold: true,
                ),
              ],
            ),
            const Gap(24),
            if (!isSwapPending) ...[
              const BBText.title('Transaction ID'),
              const Gap(4),
              InkWell(
                onTap: () {
                  final url = context
                      .read<NetworkCubit>()
                      .state
                      .explorerTxUrl(txid, isLiquid: tx.isLiquid);
                  locator<Launcher>().launchApp(url);
                },
                child: BBText.body(txid, isBlue: true),
              ),
              const Gap(24),
            ],
            if (recipients.isNotEmpty &&
                recipientAddress.address.isNotEmpty) ...[
              const BBText.title('Recipient Bitcoin Address'),
              // const Gap(4),
              InkWell(
                onTap: () {
                  final url =
                      context.read<NetworkCubit>().state.explorerAddressUrl(
                            recipientAddress.address,
                            isLiquid: tx.isLiquid,
                          );
                  locator<Launcher>().launchApp(url);
                },
                child: BBText.body(recipientAddress.address, isBlue: true),
              ),

              const Gap(24),
            ],
            if (status.isNotEmpty && !isSwapPending) ...[
              const BBText.title(
                'Status',
              ),
              const Gap(4),
              BBText.titleLarge(
                status,
                isBold: true,
              ),
              const Gap(24),
            ],
            const BBText.title(
              'Network Fee',
            ),
            const Gap(4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                BBText.titleLarge(
                  feeStr,
                  isBold: true,
                ),
                const Gap(4),
                BBText.title(
                  units,
                  isBold: true,
                ),
              ],
            ),
            const Gap(24),
            if (!isSwapPending) ...[
              BBText.title(
                isReceived ? 'Transaction received' : 'Transaction sent',
              ),
              const Gap(4),
              BBText.titleLarge(
                time,
                isBold: true,
              ),
              if (broadcastTime != null) ...[
                const Gap(24),
                const BBText.title(
                  'Sent Time',
                ),
                BBText.titleLarge(
                  timeago.format(broadcastTime),
                  isBold: true,
                ),
              ],
              const Gap(24),
            ],
            const BBText.title(
              'Change Label',
            ),
            const Gap(4),
            const TxLabelTextField(),
            const Gap(24),
            if (err.isNotEmpty) ...[
              const Gap(32),
              BBText.errorSmall(
                err,
              ),
            ],
            // const Gap(100),
          ],
        ),
      ),
    );
  }
}

class _SwapDetails extends StatelessWidget {
  const _SwapDetails();

  @override
  Widget build(BuildContext context) {
    final tx = context.select((TransactionCubit cubit) => cubit.state.tx);
    final status = context.select(
      (TransactionCubit cubit) => cubit.state.tx.swapTx?.status?.status,
    );
    final isLiq = tx.isLiquid;
    // final showQr = status?.showQR ?? true; // may not be required

    final swap = tx.swapTx;
    if (swap == null) return const SizedBox.shrink();
    final statusStr = status.getStr(swap.isSubmarine);

    final _ = tx.swapTx?.txid?.isNotEmpty ?? false;

    final amt = swap.outAmount;
    final amount = context.select(
      (CurrencyCubit x) => x.state.getAmountInUnits(amt, removeText: true),
    );
    final isReceive = !swap.isSubmarine;

    final date = tx.getDateTimeStr();
    // swap.
    final id = swap.id;
    final fees = swap.totalFees() ?? 0;
    final feesAmount = context.select(
      (CurrencyCubit x) => x.state.getAmountInUnits(fees, removeText: true),
    );
    // final invoice = swap.invoice;
    final units = context.select(
      (CurrencyCubit cubit) => cubit.state.getUnitString(isLiquid: isLiq),
    );
    // status of swap should be read from WalletBloc.state.wallet.transactions
    // final status = context.select((WatchTxsBloc _) => _.state.showStatus(swap));

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Gap(24),
            BBText.title(
              isReceive ? 'Amount received' : 'Amount sent',
            ),
            const Gap(4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  transformAlignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(isReceive ? 1 : -1),
                  child: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 12,
                  ),
                ),
                const Gap(8),
                BBText.titleLarge(
                  amount,
                  isBold: true,
                ),
                const Gap(4),
                BBText.title(
                  units,
                  isBold: true,
                ),
              ],
            ),
            if (fees != 0) ...[
              const Gap(24),
              const BBText.title('Total fees'),
              const Gap(4),
              Row(
                children: [
                  BBText.titleLarge(feesAmount, isBold: true),
                  const Gap(4),
                  BBText.title(units, isBold: true),
                ],
              ),
            ],
            const Gap(24),
            if (id.isNotEmpty) ...[
              const BBText.title('Swap ID'),
              const Gap(4),
              Row(
                children: [
                  BBText.titleLarge(
                    id,
                    isBold: true,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (locator.isRegistered<Clippboard>())
                        await locator<Clippboard>().copy(id);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied to clipboard')),
                      );
                    },
                    iconSize: 24,
                    color: Colors.blue,
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
              const Gap(24),
            ],
            const Gap(4),
            if (statusStr != null) ...[
              const BBText.title('Status'),
              const Gap(4),
              BBText.titleLarge(
                statusStr.$1,
                isBold: true,
              ),
              const Gap(4),
              BBText.bodySmall(
                statusStr.$2,
              ),
            ],
            const Gap(4),
            const Gap(24),
            if (date.isNotEmpty) ...[
              BBText.title(
                isReceive ? 'Tranaction received' : 'Transaction sent',
              ),
              const Gap(4),
              BBText.titleLarge(date, isBold: true),
              const Gap(32),
            ],
            // if (showQr)
            //   Center(
            //     child: SizedBox(
            //       width: 300,
            //       child: Column(
            //         children: [
            //           ReceiveQRDisplay(address: invoice),
            //           ReceiveDisplayAddress(
            //             addressQr: invoice,
            //             fontSize: 10,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}

extension X on boltz.SwapStatus? {
  (String, String)? getStr(bool isSubmarine) {
    (String, String) status = ('', '');
    switch (this) {
      case boltz.SwapStatus.swapCreated:
        status =
            ('Created', 'Swap has been created but no payment has been made.');
      case boltz.SwapStatus.swapExpired:
        status = ('Expired', 'Swap has expired');
      case boltz.SwapStatus.swapRefunded:
        status = ('Refunded', 'Swap has been successfully refunded');
      case boltz.SwapStatus.swapError:
        status = ('Error', 'Swap was unsuccessful');
      case boltz.SwapStatus.txnMempool:
        status = (
          'Mempool',
          isSubmarine
              ? 'You have paid the swap lockup transaction. The invoice will be paid as soon as the transaction is confirmed.'
              : 'Boltz has made the lockup transaction, you will be able to claim it as soon as the transaction is confirmed.'
        );
      case boltz.SwapStatus.txnClaimPending:
        status = (
          'Claim Pending',
          'The lightning invoice has been paid. Waiting for boltz to complete the swap.'
        );
      case boltz.SwapStatus.txnClaimed:
        status = ('Claimed', 'The swap is completed.');
      case boltz.SwapStatus.txnConfirmed:
        status = (
          'Confirmed',
          isSubmarine
              ? 'Your lockup transaction is confirmed. The invoice will be paid momentarily.'
              : 'Boltz lockup transaction is confirmed. The swap will be claimed and you will recieve funds after the claim transaction gets confirmed.'
        );
      case boltz.SwapStatus.txnRefunded:
        status = ('Refunded', 'The swap has been successfully refunded.');
      case boltz.SwapStatus.txnFailed:
        status = ('Transaction Failed', 'The swap will be refunded.');
      case boltz.SwapStatus.txnLockupFailed:
        status = ('Transaction  Lockup Failed', 'The swap will be refunded.');
      case boltz.SwapStatus.invoiceSet:
        status = ('Invoice Set', 'The invoice for the swap has been set.');
      case boltz.SwapStatus.invoicePending:
        status = ('Invoice Pending', 'Payment of the invoice is in progress');
      case boltz.SwapStatus.invoicePaid:
        status = ('Invoice-Paid', 'The invoice has been successfully paid.');
      case boltz.SwapStatus.invoiceFailedToPay:
        status = (
          'Failed to pay invoice',
          'The invoice has failed to pay. This transaction will be refunded.'
        );
      case boltz.SwapStatus.invoiceSettled:
        status = (
          'Invoice Settled',
          'The invoice has settled and the swap is completed.'
        );
      case boltz.SwapStatus.invoiceExpired:
        status = (
          'Invoice Expired',
          'The invoice has expirted. Swap will be deleted.'
        );
      case boltz.SwapStatus.minerfeePaid:
        status = ('Miner Fee Paid.', '');
      case null:
        return null;
    }
    return status;
  }
}
