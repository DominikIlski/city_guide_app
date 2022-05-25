import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Guide'),
      ),
    );
  }
}
