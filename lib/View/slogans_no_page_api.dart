import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/slogans_no_page.dart';
import 'package:http/http.dart' as http;

class SloganNoPageApi extends StatefulWidget {
  const SloganNoPageApi({super.key});

  @override
  State<SloganNoPageApi> createState() => _SloganNoPageApiState();
}

class _SloganNoPageApiState extends State<SloganNoPageApi> {
  List<SlogansNoPage>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/slogans_list_no_page"));
    if (response.statusCode == 200) {
      getresponse = SlogansNoPage.ofSlogansNoPage(jsonDecode(response.body));
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
        title: const Text("Slogans no pagination API"),
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
