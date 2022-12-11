import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () => onPressed(context),
              child: const Text("Proceed"),
            )),
      ),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.of(context).pushNamed("/home");
  }
}
