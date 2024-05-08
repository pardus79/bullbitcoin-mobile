import 'package:flutter/material.dart';

class BBButton extends StatelessWidget {
  const BBButton({super.key, required this.label, this.isCenter = true, this.isLoading = false, this.onSubmit});

  final String label;
  final bool isCenter;
  final bool isLoading;
  final void Function(BuildContext)? onSubmit;

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: isLoading == true
          ? null
          : () {
              if (onSubmit != null) {
                onSubmit!(context);
              }
            },
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (isLoading)
          const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              )),
        if (isLoading) const SizedBox(width: 15),
        Text(label)
      ]),
    );

    if (isCenter) {
      return Center(child: button);
    } else {
      return button;
    }
  }
}
