import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/family.dart';
import 'package:http/http.dart' as http;

class FamilyApi extends StatefulWidget {
  const FamilyApi({super.key});

  @override
  State<FamilyApi> createState() => _FamilyApiState();
}

class _FamilyApiState extends State<FamilyApi> {
  List<Family>? getresponse;
  getdata() async {
    var response = await http.get(
        Uri.parse("https://mapi.trycatchtech.com/v3/virat_kohli/family_list"));
    if (response.statusCode == 200) {
      getresponse = Family.ofFamily(jsonDecode(response.body));
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
        title: const Text("Family API"),
        centerTitle: true,
      ),
      body: GridView.builder(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${getresponse![i].title}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${getresponse![i].image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
