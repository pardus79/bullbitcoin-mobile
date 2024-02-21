import 'package:bb_mobile/_ui/components/text.dart';
import 'package:bb_mobile/_ui/label_field.dart';
import 'package:bb_mobile/settings/bloc/lighting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Testground extends StatefulWidget {
  const Testground();
  @override
  State<Testground> createState() => _TestgroundState();
}

class _TestgroundState extends State<Testground> {
  final List<String> _combinedLabels = <String>[
    'grocery',
    'travel',
    'services',
    'food',
    'income:business',
    'income:payouts',
    'income:rent',
  ];

  List<String> labels = <String>[];

  void _onChanged(List<String> list) {
    print(list);
  }

  // @override
  // Widget build(BuildContext context) {
  //   context.read<Lighting>().toggle(ThemeLighting.light);
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const BBText.title('Label field sample'),
  //     ),
  //     body: LabelField(
  //       key: const Key('labelField'),
  //       combinedLabels: _combinedLabels,
  //       onChanged: _onChanged,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    context.read<Lighting>().toggle(ThemeLighting.light);
    return Scaffold(
      appBar: AppBar(
        title: const BBText.title('Label field sample'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              child: LabelField(
                key: const Key('labelFieldTest'),
                combinedLabels: _combinedLabels,
                onChanged: _onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
