import 'package:flutter/material.dart';

class QuotesNoPageApi extends StatefulWidget {
  const QuotesNoPageApi({super.key});

  @override
  State<QuotesNoPageApi> createState() => _QuotesNoPageApiState();
}

class _QuotesNoPageApiState extends State<QuotesNoPageApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes no pagination API"),
        centerTitle: true,
      ),
    );
  }
}
