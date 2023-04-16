import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scaner/scanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = "data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QC"),
      ),
      body: Center(
        child: Text(
          _result != null ? _result : 'Data',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.center_focus_strong),
        onPressed: _openScanner,
      ),
    );
  }

  void _openScanner() {
    Navigator.push(context, MaterialPageRoute(builder: (c) => Scanner()));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_result', _result));
    properties.add(StringProperty('_result', _result));
  }
}
