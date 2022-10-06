import 'dart:convert';

import 'package:cointicker/services.dart/news_data.dart';
import 'package:cointicker/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

String newsAPIurl =
    'https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=9c337956eae7413bbc102eb80bc23327';

class NewsScreen extends StatefulWidget {
  static const String routeName = 'NewsScreen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> newsData = [];

  Future fetchNewsData() async {
    var response = await http.get(
      Uri.parse(
        newsAPIurl,
      ),
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var jsonBody = json.decode(responseBody);
      for (var data in jsonBody["articles"]) {
        newsData.add(News(
            author: data['author'] ?? 'N/A',
            title: data['title'],
            description: data['description'],
            url: data['url'],
            urlToImage: data['urlToImage'] ?? 'N/A',
            publishedAt: data['publishedAt']));
      }
    } else {
      print('Something went wrong');
    }
  }

  @override
  void initState() {
    fetchNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(), itemBuilder: (BuildContext context, int index) { 
            return Column(children: [],);
           },
      
        ));
  }
}

//  NewsCard(
//               name: newsData[index].author,
//               author: newsData[index].author,
//               title: newsData[index].title,
//               description: newsData[index].description,
//               url: newsData[index].url,
//               urlToImage: newsData[index].urlToImage);

// newsData.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator.adaptive(),
//             )
