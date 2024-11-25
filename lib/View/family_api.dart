import 'package:flutter/material.dart';

class FamilyApi extends StatefulWidget {
  const FamilyApi({super.key});

  @override
  State<FamilyApi> createState() => _FamilyApiState();
}

class _FamilyApiState extends State<FamilyApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family API"),
        centerTitle: true,
      ),
    );
  }
}
