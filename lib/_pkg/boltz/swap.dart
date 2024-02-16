import 'dart:async';

import 'package:bb_mobile/_model/transaction.dart';
import 'package:bb_mobile/_pkg/error.dart';
import 'package:boltz_dart/boltz_dart.dart';

class SwapBoltz {
  final List<(String, StreamSubscription)> _subscriptions = [];

  static Future<(AllFees?, Err?)> getFeesAndLimits({
    required String boltzUrl,
    required int outAmount,
  }) async {
    try {
      final res = await AllSwapFees.estimateFee(
        boltzUrl: boltzUrl,
        outputAmount: outAmount,
      );
      return (res, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(BtcLnBoltzSwap?, Err?)> send({
    required String mnemonic,
    required int index,
    required String invoice,
    required Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required String pairHash,
  }) async {
    try {
      final res = await BtcLnBoltzSwap.newSubmarine(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );
      return (res, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(SwapTx?, Err?)> receive({
    required String mnemonic,
    required int index,
    required int outAmount,
    required Chain network,
    required String electrumUrl,
    required String boltzUrl,
    required String pairHash,
  }) async {
    try {
      final res = await BtcLnBoltzSwap.newReverse(
        mnemonic: mnemonic,
        index: index,
        outAmount: outAmount,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
        pairHash: pairHash,
      );
      final swap = SwapTx.fromBtcLnSwap(res);
      return (swap, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<Err?> watchSwap({
    required String swapId,
    required void Function(
      String id,
      SwapStatusResponse status,
    ) onUpdate,
  }) async {
    try {
      final api = await BoltzApi.newBoltzApi();
      final exists = _subscriptions.any((element) => element.$1 == swapId);
      if (exists) throw 'Already watching swap $swapId';

      _subscriptions.add(
        (
          swapId,
          api.getSwapStatusStream(swapId).listen((event) {
            onUpdate(swapId, event);
          })
        ),
      );

      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  Err? closeStream(String id) {
    try {
      final exists = _subscriptions.any((element) => element.$1 == id);
      if (!exists) throw 'No subscription for swap $id';

      final sub = _subscriptions.firstWhere((element) => element.$1 == id).$2;
      sub.cancel();
      _subscriptions.removeWhere((element) => element.$1 == id);
      return null;
    } catch (e) {
      return Err(e.toString());
    }
  }

  void dispose() {
    for (final sub in _subscriptions) {
      sub.$2.cancel();
    }
    _subscriptions.clear();
  }

  Future<(String?, Err?)> claimSwap({
    required SwapTx tx,
    required String outAddress,
    required int absFee,
  }) async {
    try {
      final swap = tx.toBtcLnSwap();

      final resp = await swap.claim(
        outAddress: outAddress,
        absFee: absFee,
      );
      return (resp, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }

  Future<(String?, Err?)> refundSwap({
    required SwapTx tx,
    required String outAddress,
    required int absFee,
  }) async {
    try {
      final swap = tx.toBtcLnSwap();

      final resp = await swap.refund(
        outAddress: outAddress,
        absFee: absFee,
      );
      return (resp, null);
    } catch (e) {
      return (null, Err(e.toString()));
    }
  }
}
