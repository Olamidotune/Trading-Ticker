import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/widgets/chat_card.dart';
import 'package:cointicker/widgets/coin_search_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const String routeName = "chat_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        toolbarHeight: 140,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Chat',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
            Text(
              'Chat with your friends, stay connected.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: CustomSearchBar("Search"),
            ),
            SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatCard(
                  onTap: () {},
                  icon: 'chat',
                  name: '$index',
                );
              },
              separatorBuilder: (context, index) =>
                  AppSpacing.verticalSpaceMedium,
            ),
          ],
        ),
      ),
    );
  }
}
