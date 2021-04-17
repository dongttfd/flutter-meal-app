import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  static const routeName = '/not-found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Text('Screen not found !'),
    );
  }
}
