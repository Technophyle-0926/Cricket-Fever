import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/rcb_images_no_page.dart';
import 'package:http/http.dart' as http;

class RcbImagesNoPageApi extends StatefulWidget {
  const RcbImagesNoPageApi({super.key});

  @override
  State<RcbImagesNoPageApi> createState() => _RcbImagesNoPageApiState();
}

class _RcbImagesNoPageApiState extends State<RcbImagesNoPageApi> {
  List<RcbImagesNoPage>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/rcb_images_list_no_page"));
    if (response.statusCode == 200) {
      getresponse =
          RcbImagesNoPage.ofRcbImagesNoPage(jsonDecode(response.body));
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
        title: const Text("RCB Images no pagination API"),
        centerTitle: true,
      ),
      body: getresponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: getresponse!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image(
                                image: NetworkImage('${getresponse![i].image}'),
                              ),
                            ),
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
