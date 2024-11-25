import 'package:flutter/material.dart';

class SlogansApi extends StatefulWidget {
  const SlogansApi({super.key});

  @override
  State<SlogansApi> createState() => _SlogansApiState();
}

class _SlogansApiState extends State<SlogansApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slogans API"),
        centerTitle: true,
      ),
    );
  }
}
