import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/quotes.dart';
import 'package:http/http.dart' as http;

class QuotesApi extends StatefulWidget {
  const QuotesApi({super.key});

  @override
  State<QuotesApi> createState() => _QuotesApiState();
}

class _QuotesApiState extends State<QuotesApi> {
  List<Quotes>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_quotes_list?page=1"));
    if (response.statusCode == 200) {
      getresponse = Quotes.ofQuotes(jsonDecode(response.body));
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
        title: const Text("Quotes API"),
        centerTitle: true,
      ),
      body: getresponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: getresponse!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        '${getresponse![i].image}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
