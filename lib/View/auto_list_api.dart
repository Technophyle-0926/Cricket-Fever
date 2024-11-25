import 'package:flutter/material.dart';

class AutoListApi extends StatefulWidget {
  const AutoListApi({super.key});

  @override
  State<AutoListApi> createState() => _AutoListApiState();
}

class _AutoListApiState extends State<AutoListApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto List API"),
        centerTitle: true,
      ),
    );
  }
}
