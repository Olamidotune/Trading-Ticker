// Fallback method when email client launch fails
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/helpers/email_helper/try_alt_email_method.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showEmailFallback(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Contact Us'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email client could not be opened automatically.'),
            const SizedBox(height: 16),
            const Text('You can reach us at:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: const Text(
                      'Davidegundeyi@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(text: 'Davidegundeyi@gmail.com'),
                    );

                    ToastService.toast('Email copied to clipboard!');
                    Navigator.of(context).pop();
                  },
                  tooltip: 'Copy email',
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Text(
              'Close',
            ),
          ),
          AppSpacing.horizontalSpaceMedium,
          GestureDetector(
            onTap: () async {
              Navigator.of(context).pop();
              await tryAlternativeEmailMethods(context);
            },
            child: const Text('Try Again'),
          ),
        ],
      );
    },
  );
}
