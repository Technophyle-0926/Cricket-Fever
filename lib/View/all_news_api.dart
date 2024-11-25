import 'package:flutter/material.dart';

class AllNewsApi extends StatefulWidget {
  const AllNewsApi({super.key});

  @override
  State<AllNewsApi> createState() => _AllNewsApiState();
}

class _AllNewsApiState extends State<AllNewsApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All News API"),
        centerTitle: true,
      ),
    );
  }
}
