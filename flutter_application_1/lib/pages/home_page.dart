import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/result_page.dart';

class GoDrawCalculatorScreen extends StatefulWidget {
  @override
  _GoDrawCalculatorScreenState createState() => _GoDrawCalculatorScreenState();
}

class _GoDrawCalculatorScreenState extends State<GoDrawCalculatorScreen> {
  final TextEditingController _controllerP1 = TextEditingController();
  final TextEditingController _controllerP2 = TextEditingController();
  final TextEditingController _controllerP3 = TextEditingController();

  String _errorMessage = '';

  void _calculateMaxDraws() {
    setState(() {
      _errorMessage = '';
    });

    if (_controllerP1.text.isEmpty || _controllerP2.text.isEmpty || _controllerP3.text.isEmpty) {
      setState(() {
        _errorMessage = 'All fields are required.';
      });
      return;
    }

    final int p1 = int.tryParse(_controllerP1.text) ?? 0;
    final int p2 = int.tryParse(_controllerP2.text) ?? 0;
    final int p3 = int.tryParse(_controllerP3.text) ?? 0;

    int maxDraws = calculateMaxDraws(p1, p2, p3);

    Navigator.pushNamed(
      context,
      ResultScreen.routeName,
      arguments: maxDraws,
    );
  }

//Logic for thr max draws
  int calculateMaxDraws(int p1, int p2, int p3) {
    if ((p1 + p2 + p3) % 2 != 0) {
      return -1;
    }

    if (p1 + p2 < p3) {
      return p1 + p2;
    }

    return (p1 + p2 + p3) ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Draw Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controllerP1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Player 1 Points',
              ),
            ),
            TextField(
              controller: _controllerP2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Player 2 Points',
              ),
            ),
            TextField(
              controller: _controllerP3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Player 3 Points',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateMaxDraws,
              child: const Text('Calculate Max Draws'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}