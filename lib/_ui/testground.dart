import 'package:bb_mobile/_ui/components/text.dart';
import 'package:bb_mobile/_ui/label_field.dart';
import 'package:bb_mobile/settings/bloc/lighting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Testground extends StatelessWidget {
  const Testground();

  static const List<String> _combinedLabels = <String>[
    'grocery',
    'travel',
    'services',
    'food',
    'income:business',
    'income:payouts',
    'income:rent',
  ];

  static const List<String> labels = <String>[];
  // final _formKey = GlobalKey<FormState>();

  // create a const function to pass to the onChanged callback
  static void _onChanged(List<String> list) {
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    context.read<Lighting>().toggle(ThemeLighting.light);
    return Scaffold(
      appBar: AppBar(
        title: const BBText.title('Label field sample'),
      ),
      body: const LabelField(
        key: Key('labelField'),
        combinedLabels: _combinedLabels,
        onChanged: _onChanged,
        // labels: labels,
      ),
    );
  }
}
