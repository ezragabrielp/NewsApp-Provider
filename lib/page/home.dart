import 'package:flutter/material.dart';
import 'package:my_news_provider/widget/news_card.dart';
import 'package:my_news_provider/provider/news_provider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<NewsData>().fetchData;
        },
        child: Center(child: Consumer<NewsData>(
          builder: ((context, value, child) {
            return value.map.isEmpty && !value.error
                ? const CircularProgressIndicator()
                : value.error
                    ? Text(
                        "Something Went Wrong! ${value.errorMessage}",
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        itemCount: value.map['articles'].length,
                        itemBuilder: (context, index) {
                          return NewsCard(map: value.map['articles'][index]);
                        },
                      );
          }),
        )),
      ),
    );
  }
}
