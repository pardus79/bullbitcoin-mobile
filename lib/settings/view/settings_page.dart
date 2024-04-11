import 'package:bb_arch/settings/view/settings_view.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return SettingsView();
    // return MultiBlocProvider(
    //   providers: [BlocProvider(create: (_) => HomeCubit())],
    //   child: const SettingsView(),
    // );
  }
}
