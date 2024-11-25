import 'package:flutter/material.dart';

class RcbImagesApi extends StatefulWidget {
  const RcbImagesApi({super.key});

  @override
  State<RcbImagesApi> createState() => _RcbImagesApiState();
}

class _RcbImagesApiState extends State<RcbImagesApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RCB Images API"),
        centerTitle: true,
      ),
    );
  }
}
