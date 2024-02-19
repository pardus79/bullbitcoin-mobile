import 'package:bb_mobile/_ui/components/chip_input.dart';
import 'package:bb_mobile/_ui/components/text.dart';
import 'package:flutter/material.dart';

const List<String> _combinedLabels = <String>[
  'grocery',
  'travel',
  'services',
  'food',
  'income:business',
  'income:payouts',
  'income:rent',
];

class LabelField extends StatefulWidget {
  const LabelField({super.key});

  @override
  LabelFieldState createState() {
    return LabelFieldState();
  }
}

class LabelFieldState extends State<LabelField> {
  final FocusNode _chipFocusNode = FocusNode();
  List<String> _labels = <String>[_combinedLabels.first];
  List<String> _suggestions = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ChipsInput<String>(
            values: _labels,
            strutStyle: const StrutStyle(fontSize: 15),
            onChanged: _onChanged,
            onSubmitted: _onSubmitted,
            chipBuilder: _chipBuilder,
            onTextChanged: _onSearchChanged,
          ),
        ),
        if (_suggestions.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (BuildContext context, int index) {
                return LabelSuggestion(
                  _suggestions[index],
                  onTap: _selectSuggestion,
                );
              },
            ),
          ),
      ],
    );
  }

  Future<void> _onSearchChanged(String value) async {
    final List<String> results = await _suggestionCallback(value);
    setState(() {
      _suggestions = results.where((String label) => !_labels.contains(label)).toList();
    });
  }

  Widget _chipBuilder(BuildContext context, String label) {
    return LabelInputChip(
      label: label,
      onDeleted: _onChipDeleted,
      onSelected: _onChipTapped,
    );
  }

  void _selectSuggestion(String label) {
    setState(() {
      _labels.add(label);
      _suggestions = <String>[];
    });
  }

  void _onChipTapped(String label) {}

  void _onChipDeleted(String label) {
    setState(() {
      _labels.remove(label);
      _suggestions = <String>[];
    });
  }

  void _onSubmitted(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        _labels = <String>[..._labels, text.trim()];
      });
    } else {
      _chipFocusNode.unfocus();
      setState(() {
        _labels = <String>[];
      });
    }
  }

  void _onChanged(List<String> data) {
    setState(() {
      _labels = data;
    });
  }

  Future<List<String>> _suggestionCallback(String text) async {
    if (text.isNotEmpty) {
      return _combinedLabels.where((String label) {
        return label.toLowerCase().contains(text.toLowerCase());
      }).toList();
    }
    return const <String>[];
  }
}

class LabelSuggestion extends StatelessWidget {
  const LabelSuggestion(this.label, {super.key, this.onTap});

  final String label;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ObjectKey(label),
      title: BBText.body(label),
      onTap: () => onTap?.call(label),
    );
  }
}

class LabelInputChip extends StatelessWidget {
  const LabelInputChip({
    super.key,
    required this.label,
    required this.onDeleted,
    required this.onSelected,
  });

  final String label;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: InputChip(
        key: ObjectKey(label),
        label: BBText.body(label),
        onDeleted: () => onDeleted(label),
        onSelected: (bool value) => onSelected(label),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(2),
      ),
    );
  }
}
