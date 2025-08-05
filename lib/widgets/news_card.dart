import 'package:cached_network_image/cached_network_image.dart';
import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    required this.name,
    this.onTap,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.horizontalSpacingSmall),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).inputDecorationTheme.fillColor,
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                        ),
                        const Text(' • '),
                        Text(
                          timeAgo(publishedAt ?? DateTime.now()),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Bigger image section
              Container(
                width: 150, // Adjust as needed
                height: 100,
                margin: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: urlToImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String timeAgo(DateTime date) {
  final difference = DateTime.now().difference(date);
  if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else {
    return '${difference.inDays}d ago';
  }
}
