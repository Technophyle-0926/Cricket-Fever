import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/single_news.dart';
import 'package:http/http.dart' as http;

class SingleNewsApi extends StatefulWidget {
  const SingleNewsApi({super.key});

  @override
  State<SingleNewsApi> createState() => _SingleNewsApiState();
}

class _SingleNewsApiState extends State<SingleNewsApi> {
  SingleNews? getresponse;
  int currentPage = 1;
  getdata(int page) async {
    var response = await http.get(Uri.parse(
        'https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_single_news?news_id=$page'));
    if (response.statusCode == 200) {
      getresponse = SingleNews.fromJson(jsonDecode(response.body));
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
        title: const Text("Single News API"),
        centerTitle: true,
      ),
      body: getresponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${getresponse!.newsTitle}',
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Center(
                                child: Image(
                                  image:
                                      NetworkImage('${getresponse!.newsImage}'),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                '${getresponse!.newsDesc}',
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                        if (currentPage < 5) {
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
