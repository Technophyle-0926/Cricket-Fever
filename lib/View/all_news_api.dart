import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/all_news.dart';
import 'package:http/http.dart' as http;

class AllNewsApi extends StatefulWidget {
  const AllNewsApi({super.key});

  @override
  State<AllNewsApi> createState() => _AllNewsApiState();
}

class _AllNewsApiState extends State<AllNewsApi> {
  List<AllNews>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        'https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_news_list'));
    if (response.statusCode == 200) {
      getresponse = AllNews.ofAllNews(jsonDecode(response.body));
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
        title: const Text("All News API"),
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
                  padding: const EdgeInsets.all(16.0),
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
                            '${getresponse![i].newsTitle}',
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
                                  NetworkImage('${getresponse![i].newsImage}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
