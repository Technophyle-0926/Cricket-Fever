import 'package:flutter/material.dart';

class RcbImagesNoPageApi extends StatefulWidget {
  const RcbImagesNoPageApi({super.key});

  @override
  State<RcbImagesNoPageApi> createState() => _RcbImagesNoPageApiState();
}

class _RcbImagesNoPageApiState extends State<RcbImagesNoPageApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RCB Images no pagination API"),
        centerTitle: true,
      ),
    );
  }
}
