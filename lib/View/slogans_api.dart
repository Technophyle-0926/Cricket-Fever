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
  int currentPage = 1;
  getdata(int page) async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/slogans_list?page=$page"));
    if (response.statusCode == 200) {
      getresponse = Slogans.ofSlogans(jsonDecode(response.body));
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
        title: const Text("Slogans API"),
        centerTitle: true,
      ),
      body: getresponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
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
            ),
    );
  }
}
