import 'package:flutter/material.dart';

class SingleNewsApi extends StatefulWidget {
  const SingleNewsApi({super.key});

  @override
  State<SingleNewsApi> createState() => _SingleNewsApiState();
}

class _SingleNewsApiState extends State<SingleNewsApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single News API"),
        centerTitle: true,
      ),
    );
  }
}
