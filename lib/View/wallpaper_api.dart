import 'package:flutter/material.dart';

class WallpaperApi extends StatefulWidget {
  const WallpaperApi({super.key});

  @override
  State<WallpaperApi> createState() => _WallpaperApiState();
}

class _WallpaperApiState extends State<WallpaperApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpaper API"),
        centerTitle: true,
      ),
    );
  }
}
