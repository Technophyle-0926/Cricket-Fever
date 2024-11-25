import 'package:flutter/material.dart';

class VideosApi extends StatefulWidget {
  const VideosApi({super.key});

  @override
  State<VideosApi> createState() => _VideosApiState();
}

class _VideosApiState extends State<VideosApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos API"),
        centerTitle: true,
      ),
    );
  }
}
