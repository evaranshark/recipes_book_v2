import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          onPressed: () => onPressed(context),
          child: Text("Proceed"),
        )
      ),
    );
  }


  void onPressed(BuildContext context) {
    Navigator.of(context).pushNamed("/home");
  }
}