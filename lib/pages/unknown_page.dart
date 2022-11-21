import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {

  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Page not found"),
      ),
    );
  }

}