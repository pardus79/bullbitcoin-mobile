// ignore_for_file: avoid_print

import 'package:bb_arch/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Move to WalletBloc
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
