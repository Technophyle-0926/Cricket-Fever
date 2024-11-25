import 'package:flutter/material.dart';

class WallpaperNoPageApi extends StatefulWidget {
  const WallpaperNoPageApi({super.key});

  @override
  State<WallpaperNoPageApi> createState() => _WallpaperNoPageApiState();
}

class _WallpaperNoPageApiState extends State<WallpaperNoPageApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpaper no pagination API"),
        centerTitle: true,
      ),
    );
  }
}
