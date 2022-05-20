import 'package:flutter/material.dart';

class Mysquare extends StatefulWidget {
  const Mysquare({Key? key}) : super(key: key);

  @override
  State<Mysquare> createState() => _MysquareState();
}

class _MysquareState extends State<Mysquare> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0,
        color: Colors.deepPurple[200],
      ),
    );
  }
}
