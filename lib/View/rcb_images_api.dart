import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/rcb_images.dart';
import 'package:http/http.dart' as http;

class RcbImagesApi extends StatefulWidget {
  const RcbImagesApi({super.key});

  @override
  State<RcbImagesApi> createState() => _RcbImagesApiState();
}

class _RcbImagesApiState extends State<RcbImagesApi> {
  List<RcbImages>? getresponse;
  int currentPage = 1;
  getdata(int page) async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/rcb_images_list?page=$page"));
    if (response.statusCode == 200) {
      getresponse = RcbImages.ofRcbImages(jsonDecode(response.body));
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
        title: const Text("RCB Images API"),
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
                    child: GridView.builder(
                        itemCount: getresponse!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Image(
                                          image: NetworkImage(
                                              '${getresponse![i].image}'),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ),
    );
  }
}
