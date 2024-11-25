import 'package:flutter/material.dart';
import 'package:virat_kohli/Model/page.dart';
import 'package:virat_kohli/View/view.dart';

// import 'package:virat_kohli/View/all_news_api.dart';
// import 'package:virat_kohli/View/auto_list_api.dart';
// import 'package:virat_kohli/View/family_api.dart';
// import 'package:virat_kohli/View/personal_quotes_api.dart';
// import 'package:virat_kohli/View/quotes_api.dart';
// import 'package:virat_kohli/View/quotes_no_page_api.dart';
// import 'package:virat_kohli/View/rcb_images_api.dart';
// import 'package:virat_kohli/View/rcb_images_no_page_api.dart';
// import 'package:virat_kohli/View/single_news_api.dart';
// import 'package:virat_kohli/View/slogans_api.dart';
// import 'package:virat_kohli/View/slogans_no_page_api.dart';
// import 'package:virat_kohli/View/videos_api.dart';
// import 'package:virat_kohli/View/videos_no_page_api.dart';
// import 'package:virat_kohli/View/wallpaper_api.dart';
// import 'package:virat_kohli/View/wallpaper_no_page_api.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Pages> ofPages = [
    Pages(title: "Slogans", page: const SlogansApi()),
    Pages(title: "RCB Images", page: const RcbImagesApi()),
    Pages(title: "All news", page: const AllNewsApi()),
    Pages(title: "Quotes", page: const QuotesApi()),
    Pages(title: "Videos", page: const VideosApi()),
    Pages(title: "Wallpapers", page: const WallpaperApi()),
    Pages(title: "Slogans no pagination", page: const SloganNoPageApi()),
    Pages(title: "RCB Images no pagination", page: const RcbImagesNoPageApi()),
    Pages(title: "Single News", page: const SingleNewsApi()),
    Pages(title: "Quotes no pagination", page: const QuotesNoPageApi()),
    Pages(title: "Videos no pagination", page: const VideosNoPageApi()),
    Pages(title: "Wallpapers no pagination", page: const WallpaperNoPageApi()),
    Pages(title: "Personal Quotes", page: const PersonalQuotesApi()),
    Pages(title: "Family", page: const FamilyApi()),
    Pages(title: "Auto List", page: const AutoListApi()),
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
