import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/search_user.dart';
import 'package:cointicker/widgets/chat_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  static const String routeName = "chat_screen";

  @override
  Widget build(BuildContext context) {
    final queryResultSet = useState<List<dynamic>>([]);
    final tempSearchStore = useState<List<dynamic>>([]);

    final isSearch = useState(false);

    void initSearch(String value) {
      if (value.isEmpty) {
        queryResultSet.value = [];
        tempSearchStore.value = [];
        return;
      }

      final capValue = value.substring(0, 1).toUpperCase() + value.substring(1);

      if (queryResultSet.value.isEmpty && value.length == 1) {
        SearchUser().search(value).then((QuerySnapshot docs) {
          queryResultSet.value = docs.docs.map((doc) => doc.data()).toList();
        });
      } else {
        tempSearchStore.value = queryResultSet.value.where((element) {
          //remember to change to userName
          return element['fullName'].startsWith(capValue);
        }).toList();
      }
    }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat with your friends, stay connected.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  GestureDetector(
                      onTap: () => isSearch.value = !isSearch.value,
                      child: isSearch.value
                          ? const SizedBox.shrink()
                          : CircleAvatar(
                              backgroundColor: AppColors.whiteColor,
                              radius: 25,
                              child: SvgPicture.asset('assets/svg/search.svg'),
                            ))
                ],
              ),
              AppSpacing.verticalSpaceHuge
            ],
          ),
          bottom: isSearch.value
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SearchBar(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  const TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.search,
                                backgroundColor: WidgetStateProperty.all(
                                    AppColors.whiteColor),
                                leading:
                                    SvgPicture.asset('assets/svg/search.svg'),
                                hintText: "Search",
                                hintStyle: WidgetStateProperty.all(
                                  const TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                onChanged: (value) => initSearch(value),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => isSearch.value = !isSearch.value,
                              child: const CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  radius: 25,
                                  child: Icon(Icons.close)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : null),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
        child: isSearch.value
            ? ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: tempSearchStore.value.length,
                itemBuilder: (context, index) {
                  final user = tempSearchStore.value[index];

                  return SearchUsers(
                    //remember to change to userName
                    userName: user['fullName'],
                    msg: user['email'],
                  );
                },
              )
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox.shrink()),
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

class SearchUsers extends StatelessWidget {
  final String? userName;
  final String? time;
  final String? msg;

  const SearchUsers({
    super.key,
    this.userName,
    this.time,
    this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      leading: CircleAvatar(
        child: Text(
          (userName?.isNotEmpty ?? false) ? userName![0].toUpperCase() : '?',
        ),
      ),
      title: Text(
        userName ?? 'Unknown user',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        msg ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(time ?? ''),
    );
  }
}
