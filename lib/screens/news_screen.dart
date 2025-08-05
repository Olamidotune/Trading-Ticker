import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:cointicker/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'NewsScreen';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: CoinSearchBar(),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 25,
                          child: SvgPicture.asset(
                            'assets/svg/filter.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('News',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.whiteColor,
                      )),
              Text('Get the latest crypto news here.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400,
                      )),
            ],
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontalSpacingSmall),
              child: ListView.builder(
                itemCount: state.news?.length ?? 0,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final news = state.news?[index];
                  return NewsCard(
                    onTap: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent.fetchNews('sex'));
                    },
                    name: news?.source?.name ?? 'No Title',
                    author: news?.author ?? 'No Author',
                    title: news?.title ?? 'No Title',
                    description: news?.description ?? 'No Description',
                    url: news?.url ?? '',
                    urlToImage: news?.urlToImage ?? '',
                    publishedAt: news?.publishedAt,
                  );
                },
              ),
            );
          },
        ));
  }
}
