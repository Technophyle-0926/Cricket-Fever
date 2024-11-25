import 'package:flutter/material.dart';

class SloganApi extends StatefulWidget {
  const SloganApi({super.key});

  @override
  State<SloganApi> createState() => _SloganApiState();
}

class _SloganApiState extends State<SloganApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slogans no pagination API"),
        centerTitle: true,
      ),
    );
  }
}
