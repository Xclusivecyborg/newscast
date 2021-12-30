import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newscast/view/news_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newscast/widgets/news_body.dart';

import 'news_viewstate.dart';

final viewModelProvider =
    StateNotifierProvider<NewsViewModel, NewsViewState>((val) {
  return NewsViewModel();
});

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends ConsumerState<NewsPage> {
  @override
  void initState() {
    final model = ref.read(viewModelProvider.notifier);
    model.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final view = ref.watch(viewModelProvider);
    return Scaffold(
      body: view.articles == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      "News",
                      style: GoogleFonts.lato(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          offset: Offset(0, 0),
                          spreadRadius: 4,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 30),
                        itemCount: view.articles!.length,
                        shrinkWrap: true,
                        itemBuilder: (_, __) {
                          var time = DateFormat('MMM, d')
                              .format(view.articles![__].publishedAt!);
                          return NewsBody(
                            image: view.articles![__].image!,
                            source: view.articles![__].source!,
                            title: view.articles![__].title!,
                            url: view.articles![__].url!,
                            time: time,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
