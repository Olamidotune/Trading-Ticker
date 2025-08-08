import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/price_screen.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends HookWidget {
  static const String routeName = 'NewsScreen';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isAtBottomNotifier = useState(false);

    final controller = useAnimationController();

    useEffect(() {
      void onScroll() {
        final isAtBottom = scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200;

        isAtBottomNotifier.value = isAtBottom;

        if (isAtBottom) {
          final bloc = context.read<NewsBloc>();
          if (bloc.state.getNewsStatus.isSuccess) {
            bloc.add(
              NewsEvent.fetchNews(
                bloc.state.searchKey ?? 'Cryptocurrency',
                bloc.state.page + 1,
                _getDefaultFromDate(),
              ),
            );
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      floatingActionButton: HookBuilder(
        builder: (context) {
          final isAtBottom = isAtBottomNotifier.value;

          return FloatingActionButton.extended(
            onPressed: () {
              context.read<NewsBloc>().add(
                    NewsEvent.fetchNews(
                      context.read<NewsBloc>().state.searchKey ??
                          'Cryptocurrency',
                      context.read<NewsBloc>().state.page + 1,
                      _getDefaultFromDate(),
                    ),
                  );
            },
            label: Text(isAtBottom ? 'Next Page' : 'Prev Page'),
            backgroundColor: isAtBottom ? Colors.red : Colors.green,
          );
        },
      ),
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'News',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
            Text(
              'Get the latest crypto news here.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        toolbarHeight: 140,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.getNewsStatus == FormzSubmissionStatus.inProgress &&
              (state.news?.isEmpty ?? true)) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomShimmer();
              },
            );
          }
          if ((state.news?.isEmpty ?? true) ||
              state.getNewsStatus == FormzSubmissionStatus.failure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: Lottie.asset(
                      width: double.infinity,
                      'assets/lottie/no_data.json',
                      controller: controller,
                      repeat: false, onLoaded: (composition) {
                    controller
                      ..duration = composition.duration
                      ..repeat();
                  }),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                )
              ],
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalSpacingSmall,
            ),
            child: ListView.builder(
              controller: scrollController,
              itemCount: state.news?.length ?? 0,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final news = state.news?[index];
                return NewsCard(
                  onTap: () {
                    openUrl(news?.url ?? '');
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
      ),
    );
  }
}

String _getDefaultFromDate() {
  final now = DateTime.now();
  final twoWeeksAgo = now.subtract(const Duration(days: 14));
  return twoWeeksAgo.toIso8601String().split('T').first;
}

void openUrl(String? url) async {
  if (url == null || url.isEmpty) {
    logError("URL is null or empty", StackTrace.current);
    return;
  }
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }
}
