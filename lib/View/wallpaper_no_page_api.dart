import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/wallpaper_no_page.dart';
import 'package:http/http.dart' as http;

class WallpaperNoPageApi extends StatefulWidget {
  const WallpaperNoPageApi({super.key});

  @override
  State<WallpaperNoPageApi> createState() => _WallpaperNoPageApiState();
}

class _WallpaperNoPageApiState extends State<WallpaperNoPageApi> {
  List<WallpaperNoPage>? getresponse;
  getdata() async {
    var response = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/virat_kohli/wallpapers_list"));
    if (response.statusCode == 200) {
      getresponse =
          WallpaperNoPage.ofWallpapersNoPage(jsonDecode(response.body));
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
        title: const Text("Wallpaper no pagination API"),
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
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${getresponse![i].image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
