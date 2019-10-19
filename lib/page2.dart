import 'package:flutter/material.dart';

class NewPage2 extends StatelessWidget {
  //final String datos;
  //final String body2;
  //NewPage(this.datos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "text 1",
        ),
      ),
      body: Center(
        child: Text(
          "text2",
        ),
      ),
    );
  }
}
