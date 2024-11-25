import 'dart:math';

import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/page.dart';
import 'package:virat_kohli/View/rcb_images_api.dart';
import 'package:virat_kohli/View/slogan_api.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Pages> ofPages = [
    Pages(title: "Slogans no pagination", page: const SloganApi()),
    Pages(title: "RCB Images", page: const RcbImagesApi()),
    Pages(title: "All news", page: const SloganApi()),
    Pages(title: "Quotes", page: const SloganApi()),
    Pages(title: "Videos", page: const SloganApi()),
    Pages(title: "Wallpapers", page: const SloganApi()),
    Pages(title: "Slogans", page: const SloganApi()),
    Pages(title: "Single News", page: const SloganApi()),
    Pages(title: "Wallpapers no pagination", page: const SloganApi()),
    Pages(title: "Quotes no pagination", page: const SloganApi()),
    Pages(title: "Videos no pagination", page: const SloganApi()),
    Pages(title: "RCB Images no pagination", page: const SloganApi()),
    Pages(title: "Personal Quotes", page: const SloganApi()),
    Pages(title: "Family", page: const SloganApi()),
    Pages(title: "Auto List", page: const SloganApi()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cricket Fever"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: ofPages.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ofPages[index].page));
                },
                child: Text(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ofPages[index].title.toString(),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
