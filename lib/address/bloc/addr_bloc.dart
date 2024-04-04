// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bb_arch/_pkg/address/address_repository.dart';
import 'package:bb_arch/_pkg/address/models/address.dart';
import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/tx/tx_repository.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/address/bloc/addr_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'addr_event.dart';

class AddrBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addrRepository;

  AddrBloc({required this.addrRepository}) : super(const AddressState()) {
    on<LoadAddresses>(_onLoadAddresses);
    on<SyncAddresss>(_onSyncAddresses);
    on<SelectAddress>(_onSelectAddress);
  }

  void _onLoadAddresses(LoadAddresses event, Emitter<AddressState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    print('_onLoadAddresses: ${event.wallet.name}');

    final (ads, err) = await addrRepository.listAddresses(event.wallet);
    if (err != null) {
      emit(state.copyWith(addresses: [], status: LoadStatus.failure, error: err.toString()));
      return;
    }
    emit(state.copyWith(addresses: ads ?? [], status: LoadStatus.success));
  }

  void _onSyncAddresses(SyncAddresss event, Emitter<AddressState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    print('_onSyncAddresses: ${event.wallet.name}');

    final (ads, err) = await addrRepository.syncAddresses(event.oldAddresses, event.wallet);
    if (err != null) {
      emit(state.copyWith(addresses: [], status: LoadStatus.failure, error: err.toString()));
      return;
    }
    // await txRepository.persistTxs(event.wallet, txs!);
    // */
    emit(state.copyWith(addresses: ads!, status: LoadStatus.success));
  }

  void _onSelectAddress(SelectAddress event, Emitter<AddressState> emit) async {
    emit(state.copyWith(selectedAddress: event.address));
  }
}
