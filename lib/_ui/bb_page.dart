import 'package:bb_arch/_pkg/misc.dart';
import 'package:flutter/material.dart';

class BBScaffold extends StatelessWidget {
  final String title;
  final Widget? child;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final LoadStatus? loadStatus;
  final String? errorText;

  const BBScaffold(
      {super.key,
      required this.title,
      this.child,
      this.actions,
      this.floatingActionButton,
      this.loadStatus = LoadStatus.success,
      this.errorText = ''});

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );

    if (loadStatus == LoadStatus.success) {
      bodyWidget = child!;
    } else if (loadStatus == LoadStatus.failure) {
      bodyWidget = Text(errorText!);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: actions,
      ),
      body: bodyWidget,
      floatingActionButton: loadStatus == LoadStatus.success ? floatingActionButton : null,
    );
  }
}
