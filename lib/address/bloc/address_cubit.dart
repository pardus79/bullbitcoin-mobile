// ignore_for_file: avoid_print

import 'package:bb_arch/address/bloc/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Move to WalletBloc
class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState.initial());
}
