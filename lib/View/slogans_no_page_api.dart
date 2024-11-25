import 'package:flutter/material.dart';

class SloganNoPageApi extends StatefulWidget {
  const SloganNoPageApi({super.key});

  @override
  State<SloganNoPageApi> createState() => _SloganNoPageApiState();
}

class _SloganNoPageApiState extends State<SloganNoPageApi> {
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
