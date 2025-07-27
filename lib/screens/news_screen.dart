import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String newsAPIurl =
    'https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=9c337956eae7413bbc102eb80bc23327';

class NewsScreen extends StatefulWidget {
  static const String routeName = 'NewsScreen';

  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.news?.length ?? 0,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final news = state.news?[index];
                return NewsCard(
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent.fetchNews('sex'));
                  },
                  name: news?.title ?? 'No Title',
                  author: news?.author ?? 'No Author',
                  title: news?.title ?? 'No Title',
                  description: news?.description ?? 'No Description',
                  url: news?.url ?? '',
                  urlToImage: news?.urlToImage ?? '',
                  publishedAt: news?.publishedAt,
                );
              },
            );
          },
        ));
  }
}
