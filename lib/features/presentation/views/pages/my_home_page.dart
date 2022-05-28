import 'package:flutter/material.dart';
import 'package:news_app_eyepax_practical/flavors.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Text(
          'ABCD ${F.title}',
        ),
      ),
    );
  }
}
