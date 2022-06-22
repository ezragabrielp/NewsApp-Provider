import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsPage extends StatelessWidget {
  final map;

  const NewsPage({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(children: [
            Image.network(
              '${map['urlToImage']}',
              fit: BoxFit.contain,
            ),
            Text(
              '${map['title']}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            )
          ]),
        ),
      ),
    );
  }
}
