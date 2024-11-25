import 'package:flutter/material.dart';

class VideosNoPageApi extends StatefulWidget {
  const VideosNoPageApi({super.key});

  @override
  State<VideosNoPageApi> createState() => _VideosNoPageApiState();
}

class _VideosNoPageApiState extends State<VideosNoPageApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos no pagination API"),
        centerTitle: true,
      ),
    );
  }
}
