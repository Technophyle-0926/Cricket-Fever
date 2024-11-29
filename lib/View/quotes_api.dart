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
  int currentPage = 1;
  getdata(int page) async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_quotes_list?page=$page"));
    if (response.statusCode == 200) {
      getresponse = Quotes.ofQuotes(jsonDecode(response.body));
      setState(() {});
    }
  }

  @override
  void initState() {
    getdata(currentPage);
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
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: getresponse!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (currentPage > 1) {
                          currentPage--;
                          getdata(currentPage);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.black,
                      ),
                      label: const Text("Previous"),
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (currentPage < 2) {
                          getdata(currentPage + 1);
                          currentPage++;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        foregroundColor: Colors.black,
                      ),
                      label: const Text("Next"),
                      icon: const Icon(Icons.keyboard_arrow_right),
                      iconAlignment: IconAlignment.end,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
