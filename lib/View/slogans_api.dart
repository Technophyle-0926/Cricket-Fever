import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/slogans.dart';
import 'package:http/http.dart' as http;

class SlogansApi extends StatefulWidget {
  const SlogansApi({super.key});

  @override
  State<SlogansApi> createState() => _SlogansApiState();
}

class _SlogansApiState extends State<SlogansApi> {
  List<Slogans>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/slogans_list?page=1"));
    if (response.statusCode == 200) {
      getresponse = Slogans.ofSlogans(jsonDecode(response.body));
      setState(() {});
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slogans API"),
        centerTitle: true,
      ),
      body: getresponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: getresponse!.length,
              itemBuilder: (context, i) {
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${getresponse![i].slogan}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
