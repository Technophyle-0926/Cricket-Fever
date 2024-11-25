import 'package:flutter/material.dart';

class QuotesApi extends StatefulWidget {
  const QuotesApi({super.key});

  @override
  State<QuotesApi> createState() => _QuotesApiState();
}

class _QuotesApiState extends State<QuotesApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes API"),
        centerTitle: true,
      ),
    );
  }
}
