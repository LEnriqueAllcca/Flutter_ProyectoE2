import 'package:evaluacion2/pages/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlutterSearch());
}

class FlutterSearch extends StatefulWidget {
  @override
  _FlutterSearchState createState() => _FlutterSearchState();
}

class _FlutterSearchState extends State<FlutterSearch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}