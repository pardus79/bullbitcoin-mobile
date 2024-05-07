import 'package:flutter/material.dart';

class BBScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const BBScaffold({super.key, required this.title, required this.child, this.actions, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: actions,
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
