import 'package:flutter/material.dart';
import 'components.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlowFit"),
        backgroundColor: Colors.pinkAccent[100],
        centerTitle: true,
      ),
      //everything under appbar is body
      body: BackgroundRectangle(),
    );
  }
}

