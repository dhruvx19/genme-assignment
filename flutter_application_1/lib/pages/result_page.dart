import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    final int maxDraws = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          '{"max_draws": $maxDraws}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}