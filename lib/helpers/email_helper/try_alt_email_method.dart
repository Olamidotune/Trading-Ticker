import 'package:cointicker/helpers/email_helper/email_fall_back.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> tryAlternativeEmailMethods(BuildContext context) async {
  final List<String> emailApps = [
    'mailto:Davidegundeyi@gmail.com?subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
    'googlegmail://co?to=Davidegundeyi@gmail.com&subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
    'ms-outlook://compose?to=Davidegundeyi@gmail.com&subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
  ];

  for (String urlString in emailApps) {
    try {
      final Uri uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return; // Success, exit the loop
      }
    } catch (e) {
      logInfo('Failed to launch $urlString: $e');
      continue; // Try next option
    }
  }

  // If all methods fail, show the fallback dialog again
  await showEmailFallback(context);
}
