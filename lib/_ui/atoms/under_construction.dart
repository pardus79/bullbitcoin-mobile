import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '[Under construction]',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
