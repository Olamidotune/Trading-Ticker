import 'package:carousel_slider/carousel_slider.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/auth/sign_up_screen.dart';
import 'package:cointicker/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});

  static const String routeName = 'onboarding_screen';

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
    final CarouselSliderController carouselController =
        CarouselSliderController();

    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final carouselImages = <String>[
      "bitcoin",
      "news",
      "contact",
      "welcome",
    ];

    final carouselTitle = <String>[
      "Track Crypto in Real Time",
      "Market & Industry Updates",
      "Need Help?",
      "Your Crypto Companion Awaits",
    ];

    final carouselSubtitle = <String>[
      "Stay updated with live prices and instant changes across your favorite cryptocurrencies.",
      "Get the latest news, trends, and insights from the crypto market and global finance industry.",
      "Whether you need assistance using the app or want to collaborate on projects, I'm just a message away.",
      "Your all-in-one app for prices, news, and insights—making crypto tracking simple and powerful.",
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * .08),

            // Carousel Slider
            CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                return _CarouselImage(
                  image: carouselImages[index],
                  title: carouselTitle[index],
                  subTitle: carouselSubtitle[index],
                  viewPortHeight: height,
                );
              },
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                height: 0.85 * height <= 500 ? 0.75 * height : 500,
                onPageChanged: (newIndex, reason) =>
                    currentIndex.value = newIndex,
              ),
            ),
            const Spacer(),
            ValueListenableBuilder<int>(
              valueListenable: currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carouselImages.length,
                    (i) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: index == i ? 20 : 8,
                      decoration: BoxDecoration(
                        color: index == i
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            ),

            AppSpacing.verticalSpaceMassive,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, index, _) {
                  final isLast = index == carouselImages.length - 1;
                  return Column(
                    children: [
                      Button(
                        isLast ? "Get Started" : "Next",
                        onPressed: () {
                          if (isLast) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, SignUpScreen.routeName, (_) => false);
                          } else {
                            carouselController.nextPage(
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        },
                      ),
                      AppSpacing.verticalSpaceMedium,
                      isLast
                          ? Button('Login',
                              onPressed: () =>
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      SignInScreen.routeName, (_) => false))
                          : const SizedBox.shrink()
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _CarouselImage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final double viewPortHeight;

  const _CarouselImage({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.viewPortHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Hero(
            tag: 'welcome',
            child: Lottie.asset(
              'assets/lottie/$image.json',
              height: viewPortHeight * .365,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            bottom: 0.45 * viewPortHeight <= 350 ? 20 : 32,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(height: 1.1),
          ),
        ),
      ],
    );
  }
}
