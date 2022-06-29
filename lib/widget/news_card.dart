import 'package:flutter/material.dart';
import 'package:my_news_provider/page/news_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsPage(
                          map: map,
                          selectedUrl: '${map['url']}',
                        )));
          },
          child: Card(
            elevation: 10,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Stack(children: [
                // ignore: unnecessary_null_comparison
                '${map['urlToImage']}' != null
                    ? Image.network(
                        '${map['urlToImage']}',
                        fit: BoxFit.contain,
                      )
                    : Image.network(
                        "https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101028/112815904-no-image-available-icon-flat-vector-illustration.jpg?ver=6",
                        fit: BoxFit.contain,
                      ),
                Text(
                  map['title'] == null ? "Anon" : '${map['title']}',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                )
              ]),
            ),
          ),
        ));
  }
}
