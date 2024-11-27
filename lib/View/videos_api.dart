import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/videos.dart';
import 'package:http/http.dart' as http;

class VideosApi extends StatefulWidget {
  const VideosApi({super.key});

  @override
  State<VideosApi> createState() => _VideosApiState();
}

class _VideosApiState extends State<VideosApi> {
  List<Videos>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_videos_list?page=1"));
    if (response.statusCode == 200) {
      getresponse = Videos.ofVideos(jsonDecode(response.body));
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
        title: const Text("Videos API"),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                '${getresponse![i].image}',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '${getresponse![i].title}',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Tap to Play Video',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
