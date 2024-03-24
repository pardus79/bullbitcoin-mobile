// ignore_for_file: avoid_print

import 'package:bb_arch/_pkg/misc.dart';
import 'package:bb_arch/_pkg/wallet/models/wallet.dart';
import 'package:bb_arch/_pkg/wallet/wallet_repository.dart';
import 'package:bb_arch/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Move to WalletBloc
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
