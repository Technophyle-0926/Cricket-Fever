import 'package:flutter/material.dart';

class PersonalQuotesApi extends StatefulWidget {
  const PersonalQuotesApi({super.key});

  @override
  State<PersonalQuotesApi> createState() => _PersonalQuotesApiState();
}

class _PersonalQuotesApiState extends State<PersonalQuotesApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Quotes API"),
        centerTitle: true,
      ),
    );
  }
}
